"use strict";
var e = {
  fetch: globalThis.fetch,
  WebSocket: globalThis.WebSocket,
  URL: globalThis.URL,
};
var t = (e, t, r) => () => {
    let o = String(e);
    if (o.startsWith("directus_"))
      throw new Error("Cannot use createItem for core collections");
    return {
      path: `/items/${o}`,
      params: r ?? {},
      body: JSON.stringify(t),
      method: "POST",
    };
  },
  r = (e, t) => {
    if (0 === e.length) throw new Error(t);
  },
  o = (e, t) => {
    if (String(e).startsWith("directus_")) throw new Error(t);
  },
  s = (e, t) => () => (
    r(String(e), "Collection cannot be empty"),
    o(e, "Cannot use deleteItem for core collections"),
    r(String(t), "Key cannot be empty"),
    { path: `/items/${e}/${t}`, method: "DELETE" }
  ),
  n = (e, t) => () => (
    r(String(e), "Collection cannot be empty"),
    o(e, "Cannot use readItems for core collections"),
    { path: `/items/${e}`, params: t ?? {}, method: "GET" }
  ),
  a = (e, t, s, n) => () => (
    r(String(t), "Key cannot be empty"),
    r(String(e), "Collection cannot be empty"),
    o(e, "Cannot use updateItem for core collections"),
    {
      path: `/items/${e}/${t}`,
      params: n ?? {},
      body: JSON.stringify(s),
      method: "PATCH",
    }
  ),
  i = {},
  l = "/",
  c = (e, t, r) => {
    let o =
        e.pathname === l
          ? t
          : ((e, t) => (
              e.endsWith(l) && (e = e.slice(0, -1)),
              t.startsWith(l) || (t = l + t),
              e + t
            ))(e.pathname, t),
      s = new globalThis.URL(o, e);
    if (r)
      for (let [e, t] of Object.entries(
        ((e) => {
          let t = {};
          if (Array.isArray(e.fields) && e.fields.length > 0) {
            let r = (e, t = []) => {
              if ("object" == typeof e) {
                let o = [];
                for (let s in e) {
                  let n = e[s] ?? [];
                  if (Array.isArray(n))
                    for (let e of n) o.push(r(e, [...t, s]));
                  else if ("object" == typeof n)
                    for (let e of Object.keys(n)) {
                      let a = n[e];
                      for (let n of a) o.push(r(n, [...t, `${s}:${e}`]));
                    }
                }
                return o.flatMap((e) => e);
              }
              return [...t, String(e)].join(".");
            };
            t.fields = e.fields.flatMap((e) => r(e)).join(",");
          }
          e.filter &&
            Object.keys(e.filter).length > 0 &&
            (t.filter = JSON.stringify(e.filter)),
            e.search && (t.search = e.search),
            "sort" in e &&
              e.sort &&
              (t.sort = "string" == typeof e.sort ? e.sort : e.sort.join(",")),
            "number" == typeof e.limit &&
              e.limit >= -1 &&
              (t.limit = String(e.limit)),
            "number" == typeof e.offset &&
              e.offset >= 0 &&
              (t.offset = String(e.offset)),
            "number" == typeof e.page &&
              e.page >= 1 &&
              (t.page = String(e.page)),
            e.deep &&
              Object.keys(e.deep).length > 0 &&
              (t.deep = JSON.stringify(e.deep)),
            e.alias &&
              Object.keys(e.alias).length > 0 &&
              (t.alias = JSON.stringify(e.alias)),
            e.aggregate &&
              Object.keys(e.aggregate).length > 0 &&
              (t.aggregate = JSON.stringify(e.aggregate)),
            e.groupBy &&
              e.groupBy.length > 0 &&
              (t.groupBy = e.groupBy.join(","));
          for (let [r, o] of Object.entries(e))
            r in t ||
              (t[r] =
                "string" == typeof o ||
                "number" == typeof o ||
                "boolean" == typeof o
                  ? String(o)
                  : JSON.stringify(o));
          return t;
        })(r)
      ))
        if (t && "object" == typeof t && !Array.isArray(t))
          for (let [r, o] of Object.entries(t))
            s.searchParams.set(`${e}[${r}]`, String(o));
        else s.searchParams.set(e, t);
    return s;
  };
const d = require("@google-cloud/dialogflow"),
  h = ((t, r = {}) => {
    let o = r.globals ? { ...e, ...r.globals } : e;
    return {
      globals: o,
      url: new o.URL(t),
      with(e) {
        return { ...this, ...e(this) };
      },
    };
  })("http://0.0.0.0:8055").with(
    (
      (e = {}) =>
      (t) => {
        let r = { ...i, ...e };
        return {
          async request(o) {
            let s = o();
            if (
              (s.headers || (s.headers = {}),
              "Content-Type" in s.headers
                ? "multipart/form-data" === s.headers["Content-Type"] &&
                  delete s.headers["Content-Type"]
                : (s.headers["Content-Type"] = "application/json"),
              "getToken" in this)
            ) {
              let e = await this.getToken();
              e &&
                (s.headers || (s.headers = {}),
                (s.headers.Authorization = `Bearer ${e}`));
            }
            let n = c(t.url, s.path, s.params),
              a = { method: s.method ?? "GET", headers: s.headers ?? {} };
            "credentials" in r && (a.credentials = r.credentials),
              s.body && (a.body = s.body),
              s.onRequest && (a = await s.onRequest(a)),
              r.onRequest && (a = await r.onRequest(a));
            let i = await (async (e, t, r = globalThis.fetch) => {
              t.headers =
                "object" != typeof t.headers || Array.isArray(t.headers)
                  ? {}
                  : t.headers;
              let o = await r(e, t);
              return (async function (e) {
                if ("object" == typeof e && e) {
                  if (
                    (function (e) {
                      return (
                        !("object" != typeof e || !e) &&
                        "headers" in e &&
                        "ok" in e &&
                        "json" in e &&
                        "function" == typeof e.json &&
                        "text" in e &&
                        "function" == typeof e.json
                      );
                    })(e)
                  ) {
                    let t = e.headers.get("Content-Type")?.toLowerCase();
                    if (
                      t?.startsWith("application/json") ||
                      t?.startsWith("application/health+json")
                    ) {
                      let t = await e.json();
                      if (!e.ok) throw t;
                      return "data" in t ? t.data : t;
                    }
                    if (
                      t?.startsWith("text/html") ||
                      t?.startsWith("text/plain")
                    ) {
                      let t = await e.text();
                      if (!e.ok) throw t;
                      return t;
                    }
                    return e;
                  }
                  return "data" in e ? e.data : e;
                }
              })(o).catch((e) => {
                throw {
                  errors: "object" == typeof e && "errors" in e ? e.errors : e,
                  response: o,
                };
              });
            })(n.toString(), a, t.globals.fetch);
            return (
              "onResponse" in s && (i = await s.onResponse(i, a)),
              "onResponse" in e && (i = await e.onResponse(i, a)),
              i
            );
          },
        };
      }
    )()
  ),
  y = {},
  p = new d.SessionsClient({
    credentials: {
      private_key:
        "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCVzoD0aBzQHWBQ\nVQH7evANEsn2l+lfguFvsqkTfFFY3bLSPUIVvZ5g2mKMzd2Lesfz4h/4YW6nqx+4\nmsSE3127wdGxeZPMxsYjNrURKuVXQZA+4Dy6DCZBOkYaXUsnhUCvndLAZ6lahhha\nitJzaiyeQIVRqgafPm4QthQy/cBOePNGXiHhbv8N5eoQr4SZVe633HJePIg4e99o\nbXytdulu1le1lHr1z/0jbECx/of2piA5/VsLropaRXfhT7CX2ehtzAfreGUxue4p\nEYWeSvtQ4ca6k1eRd6ppxYf1dufs1Pt0jqAw7ha5QPJfaRgHPlL9lP4Rg3gafx8A\ndTAFymspAgMBAAECggEACtGHHN9jQUugd9IDxXerMU6A46bfKs9xXKyAKvuTMQHl\nrEAnRG7//9+VjAnr7MA5A22k6xOM4bKTz7RBlT+U7dPBQySpXfmhjSEiHLNxLNwm\na3FXLAUSQtX6AmUSty/CLEyPT+d3N/svdA51b0dPdz2SmINZB2lYmoADtRZVK8rS\nVLqtMEaUE6I0QXqvXJ6jDzDS/NU+SQ9TBpEfLvBi0IMbBvVKLhmgHKsOD9zSunew\n4buo/sT2Rkv8jyDYKzR5ffHaFrwNnyQoyTbQqSfqyHoHqgoalWzeGb8HLfqgLm3h\nxYJPJBRf0x5nG5cWajO0r+Oa6Xj62u4BXTiDnmGe2QKBgQDI7V27ievXnGCdaSzo\ndXPV2ARVxiU+3pZP9DOmGW40n042YZckAoCcAiw9DF3HjNPN80ldggMjkTuEURXz\n2LttJj58oqqMmw73JT9dwm0SPv2xWTSq/nqtRzrW49Ad2ZgESSi9v+SJT2maOqYt\nI5hqrVt06QUgMZdpHUA/szCVFQKBgQC+3h4AJmSZ4LuoNcw3n8JF/rV+SmMK4OsC\nhNCMDDNg96KNFyOVPcRLAAeV8D4aqkrengwpwqWaOqjG8Rabjz3Q8dr7PxiiMLg4\nj6OAKadDuxhj4SlX8H6tf7t1QPkUNjspILOofWoEulL7eCq+Uj89wLUkhzPMYUNu\nfoZBCjlqxQKBgFMzh3bbG+ACjzdfkAsKZ9cLRnBGRrIL9e5Rzvle2nXL6dU3ACEX\nMC5p7+uvrT2uoR5NOfoQlkAqKZ0W/qIlAyeliIaPzVO/+ah5sg2fLw85KlBAAkE0\nc5RBRKorV8ikjABqUwaP6ZC6Y55L3vgeH0U9V/vHain0nyAVzr8R8nIpAoGABbnI\nEJ0WO3+AYaVrgOer/kmLzEQTAIqKwkKVtv3OtMP4/l6JVLrLnqxbjeXtFwOwx0ja\neI48RYoo8f7dfMEpS5FVzl+wL31iqV+1ueyF9gQw0R46DUdLpYzFZNkUH8UYtT0j\n5pQMkCO+xYhvT9JLz2Bujq/3n9PzH+dvw5e47TkCgYEAh+ChrNgV2pCZHeylZsaD\nV+/KnaINLhqzsaH9AjabFFa9ySaQAbi6qY1g8JysBOr7VhudQmWoGHhTkCQZXBLB\nsHKo3LMQPD+5DjdzzAYRdQZV2Crbp0K2XP6kf1HmcyK5KbGlo0zuJhKbrRBV4oBT\nkilj2jQIeavXokWw/r1CjOU=\n-----END PRIVATE KEY-----\n",
      client_email: "chat-bot@chat-bot-bohr.iam.gserviceaccount.com",
    },
  });
var u = (e) => {
  e.get("/", (e, t) => t.send("Hello, World!")),
    e.post("/dialogflow", async (e, r) => {
      let o = e.body.languageCode,
        s = e.body.queryText,
        n = e.body.sessionId;
      try {
        let a = await (async (e, r, o, s) => {
          try {
            let n = p.projectAgentSessionPath("chat-bot-bohr", o);
            y[o] || (y[o] = { context: {} });
            let a = {
              session: n,
              queryInput: { text: { text: r, languageCode: e } },
              queryParams: { context: y[o].context },
            };
            const i = (await p.detectIntent(a))[0].queryResult;
            y[o].context = i.outputContexts;
            const l = Date.now();
            return (
              i.fulfillmentText,
              (s.body.request_text = r),
              (s.body.response_text = i.fulfillmentText),
              (s.body.timestamp = l),
              console.log("====data====", s.body),
              await h.request(t("chat_bot", s.body)),
              { response: i.fulfillmentText }
            );
          } catch (e) {
            throw (console.error("Error in detectIntent:", e), e);
          }
        })(o, s, n, e);
        r.send(a.response);
      } catch (e) {
        console.error("Error in /dialogflow POST endpoint:", e),
          r.status(500).send("Internal Server Error");
      }
    }),
    e.post("/chat", async (e, r) => {
      try {
        const o = await h.request(t("chat_bot", e.body));
        r.json(o);
      } catch (e) {
        console.error("Error in /chat POST endpoint:", e),
          r.status(500).send("Internal Server Error");
      }
    }),
    e.get("/books", async (e, t) => {
      try {
        const e = await h.request(n("books"));
        t.json(e);
      } catch (e) {
        console.error("Error in /books GET endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.get("/books/:id", async (e, t) => {
      try {
        const r = await h.request(
          n("books", { filter: { id: Number(e.params.id) } })
        );
        t.json(r[0]);
      } catch (e) {
        console.error("Error in /books/:id GET endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.post("/books", async (e, r) => {
      try {
        const o = await h.request(t("books", e.body));
        r.json(o);
      } catch (e) {
        console.error("Error in /books POST endpoint:", e),
          r.status(500).send("Internal Server Error");
      }
    }),
    e.put("/books/:id", async (e, t) => {
      try {
        const r = await h.request(a("books", Number(e.params.id), e.body));
        t.json(r);
      } catch (e) {
        console.error("Error in /books/:id PUT endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.delete("/books/:id", async (e, t) => {
      try {
        await h.request(s("books", Number(e.params.id))), t.status(204).send();
      } catch (e) {
        console.error("Error in /books/:id DELETE endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.get("/tasks", async (e, t) => {
      try {
        const e = await h.request(n("tasks"));
        t.json(e);
      } catch (e) {
        console.error("Error in /tasks endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.post("/tasks", async (e, r) => {
      try {
        const { title: o, description: s, status: n } = e.body,
          a = await h.request(
            t("tasks", { title: o, description: s, status: n })
          );
        r.json(a);
      } catch (e) {
        console.error("Error in /tasks endpoint:", e),
          r.status(500).send("Internal Server Error");
      }
    }),
    e.get("/tasks/:id", async (e, t) => {
      try {
        const r = e.params.id,
          o = await h.request(n("tasks", { filter: { id: r } }));
        t.json(o[0]);
      } catch (e) {
        console.error("Error in /tasks/:id endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.put("/tasks/:id", async (e, t) => {
      try {
        const r = e.params.id,
          { title: o, description: s, status: n } = e.body,
          i = await h.request(
            a("tasks", r, { title: o, description: s, status: n })
          );
        t.json(i);
      } catch (e) {
        console.error("Error in /tasks/:id endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    }),
    e.delete("/tasks/:id", async (e, t) => {
      try {
        const r = e.params.id;
        await h.request(s("tasks", r)),
          t.status(200).send("Task deleted successfully");
      } catch (e) {
        console.error("Error in /tasks/:id endpoint:", e),
          t.status(500).send("Internal Server Error");
      }
    });
};
module.exports = u;
