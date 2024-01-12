import { defineEndpoint } from '@directus/extensions-sdk';
import { createDirectus, rest, readItems, createItem, updateItem, deleteItem } from '@directus/sdk';
const dialogflow = require("@google-cloud/dialogflow");
const DIRECTUS_BASE_URL = 'http://0.0.0.0:8055';

interface Book {
  title: string;
  author: string;
}

interface Schema {
  books: Book[];
}
interface Task {
	title: string;
	description: string;
	status: string;
  }
  
  interface SchemaTask {
	tasks: Task[];
  }
  

const client = createDirectus<Schema>(DIRECTUS_BASE_URL).with(rest());

const PROJECID = "chat-bot-bohr";
const CONFIGURATION = {
  credentials: {
    private_key: process.env.PRIVATE_KEY,
    client_email: process.env.CLIENT_EMAIL,
  },
};
const sessionStore:any = {};

const sessionClient = new dialogflow.SessionsClient(CONFIGURATION);

const detectIntent = async (languageCode:string, queryText:string, sessionId:string, req:any) => {
  try {
    let sessionPath = sessionClient.projectAgentSessionPath(PROJECID, sessionId);

    if (!sessionStore[sessionId]) {
      sessionStore[sessionId] = {
        context: {},
      };
    }

    let context = sessionStore[sessionId].context;

    let request = {
      session: sessionPath,
      queryInput: {
        text: {
          text: queryText,
          languageCode: languageCode,
        },
      },
      queryParams: {
        context: context,
      },
    };

    const responses = await sessionClient.detectIntent(request);
    const result = responses[0].queryResult;

    sessionStore[sessionId].context = result.outputContexts;

    const currentTime = Date.now();
    const dataToSave = {
      request_text: queryText,
      response_text: result.fulfillmentText,
      timestamp: currentTime,
    };
    req.body.request_text = queryText;
    req.body.response_text = result.fulfillmentText;
    req.body.timestamp = currentTime;

    await client.request(createItem('chat_bot', req.body));

    return {
      response: result.fulfillmentText,
    };
  } catch (error) {
    console.error('Error in detectIntent:', error);
    throw error;
  }
};



export default defineEndpoint((router) => {
  router.get('/', (_req, res) => res.send('Hello, World!'));

  // Chat-bot endpoints
  router.post("/dialogflow", async (req, res) => {
    let languageCode = req.body.languageCode;
    let queryText = req.body.queryText;
    let sessionId = req.body.sessionId;

    try {
      let responseData = await detectIntent(languageCode, queryText, sessionId, req);
      res.send(responseData.response);
    } catch (error) {
      console.error('Error in /dialogflow POST endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.post("/chat", async (req, res) => {
    try {
      const newBook = await client.request(createItem('chat_bot', req.body));
      res.json(newBook);
    } catch (error) {
      console.error('Error in /chat POST endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });
//   Endpoint for getting chat bot
router.get("/dialogflow", async (_req, res) => {
  try {
    const books = await client.request(readItems('chat-bot'));
    res.json(books);
  } catch (error) {
    console.error('Error in /dialogflow GET endpoint:', error);
    res.status(500).send('Internal Server Error');
  }
});
//   Endpoint for Books
  router.get("/books", async (_req, res) => {
    try {
      const books = await client.request(readItems('books'));
      res.json(books);
    } catch (error) {
      console.error('Error in /books GET endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.get("/books/:id", async (req, res) => {
    try {
      const book = await client.request(readItems('books', { filter: { id: Number(req.params.id) } }));
      res.json(book[0]); 
    } catch (error) {
      console.error('Error in /books/:id GET endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.post("/books", async (req, res) => {
    try {
      const newBook = await client.request(createItem('books', req.body));
      res.json(newBook);
    } catch (error) {
      console.error('Error in /books POST endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });
  router.put("/books/:id", async (req, res) => {
    try {
      const updatedBook = await client.request(updateItem('books', Number(req.params.id), req.body));
      res.json(updatedBook);
    } catch (error) {
      console.error('Error in /books/:id PUT endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.delete("/books/:id", async (req, res) => {
    try {
      await client.request(deleteItem('books', Number(req.params.id)));
      res.status(204).send();
    } catch (error) {
      console.error('Error in /books/:id DELETE endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });


//   Endpoint for tasks

  router.get("/tasks", async (_req, res) => {
    try {
      const tasks = await client.request(readItems('tasks'));
      res.json(tasks);
    } catch (error) {
      console.error('Error in /tasks endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.post("/tasks", async (req, res) => {
    try {
      const { title, description, status } = req.body;
      const newTask = await client.request(createItem('tasks', { title, description, status }));
      res.json(newTask);
    } catch (error) {
      console.error('Error in /tasks endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.get("/tasks/:id", async (req, res) => {
    try {
      const taskId = req.params.id;
      const task = await client.request(readItems('tasks', { filter: { id: taskId } }));
      res.json(task[0]);
    } catch (error) {
      console.error('Error in /tasks/:id endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.put("/tasks/:id", async (req, res) => {
    try {
      const taskId = req.params.id;
      const { title, description, status } = req.body;
      const updatedTask = await client.request(updateItem('tasks', taskId, { title, description, status }));
      res.json(updatedTask);
    } catch (error) {
      console.error('Error in /tasks/:id endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

  router.delete("/tasks/:id", async (req, res) => {
    try {
      const taskId = req.params.id;
      await client.request(deleteItem('tasks', taskId));
      res.status(200).send('Task deleted successfully');
    } catch (error) {
      console.error('Error in /tasks/:id endpoint:', error);
      res.status(500).send('Internal Server Error');
    }
  });

});
