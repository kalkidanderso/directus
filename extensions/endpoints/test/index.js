"use strict";
var t = {
  fetch: globalThis.fetch,
  WebSocket: globalThis.WebSocket,
  URL: globalThis.URL,
};
var e = (t, e, r) => () => {
    let s = String(t);
    if (s.startsWith("directus_"))
      throw new Error("Cannot use createItem for core collections");
    return {
      path: `/items/${s}`,
      params: r ?? {},
      body: JSON.stringify(e),
      method: "POST",
    };
  },
  r = (t, e) => {
    if (0 === t.length) throw new Error(e);
  },
  s = (t, e) => {
    if (String(t).startsWith("directus_")) throw new Error(e);
  },
  o = (t, e) => () => (
    r(String(t), "Collection cannot be empty"),
    s(t, "Cannot use deleteItem for core collections"),
    r(String(e), "Key cannot be empty"),
    { path: `/items/${t}/${e}`, method: "DELETE" }
  ),
  n = (t, e) => () => (
    r(String(t), "Collection cannot be empty"),
    s(t, "Cannot use readItems for core collections"),
    { path: `/items/${t}`, params: e ?? {}, method: "GET" }
  ),
  a = (t, e, o, n) => () => (
    r(String(e), "Key cannot be empty"),
    r(String(t), "Collection cannot be empty"),
    s(t, "Cannot use updateItem for core collections"),
    {
      path: `/items/${t}/${e}`,
      params: n ?? {},
      body: JSON.stringify(o),
      method: "PATCH",
    }
  ),
  i = {},
  l = "/",
  c = (t, e, r) => {
    let s =
        t.pathname === l
          ? e
          : ((t, e) => (
              t.endsWith(l) && (t = t.slice(0, -1)),
              e.startsWith(l) || (e = l + e),
              t + e
            ))(t.pathname, e),
      o = new globalThis.URL(s, t);
    if (r)
      for (let [t, e] of Object.entries(
        ((t) => {
          let e = {};
          if (Array.isArray(t.fields) && t.fields.length > 0) {
            let r = (t, e = []) => {
              if ("object" == typeof t) {
                let s = [];
                for (let o in t) {
                  let n = t[o] ?? [];
                  if (Array.isArray(n))
                    for (let t of n) s.push(r(t, [...e, o]));
                  else if ("object" == typeof n)
                    for (let t of Object.keys(n)) {
                      let a = n[t];
                      for (let n of a) s.push(r(n, [...e, `${o}:${t}`]));
                    }
                }
                return s.flatMap((t) => t);
              }
              return [...e, String(t)].join(".");
            };
            e.fields = t.fields.flatMap((t) => r(t)).join(",");
          }
          t.filter &&
            Object.keys(t.filter).length > 0 &&
            (e.filter = JSON.stringify(t.filter)),
            t.search && (e.search = t.search),
            "sort" in t &&
              t.sort &&
              (e.sort = "string" == typeof t.sort ? t.sort : t.sort.join(",")),
            "number" == typeof t.limit &&
              t.limit >= -1 &&
              (e.limit = String(t.limit)),
            "number" == typeof t.offset &&
              t.offset >= 0 &&
              (e.offset = String(t.offset)),
            "number" == typeof t.page &&
              t.page >= 1 &&
              (e.page = String(t.page)),
            t.deep &&
              Object.keys(t.deep).length > 0 &&
              (e.deep = JSON.stringify(t.deep)),
            t.alias &&
              Object.keys(t.alias).length > 0 &&
              (e.alias = JSON.stringify(t.alias)),
            t.aggregate &&
              Object.keys(t.aggregate).length > 0 &&
              (e.aggregate = JSON.stringify(t.aggregate)),
            t.groupBy &&
              t.groupBy.length > 0 &&
              (e.groupBy = t.groupBy.join(","));
          for (let [r, s] of Object.entries(t))
            r in e ||
              (e[r] =
                "string" == typeof s ||
                "number" == typeof s ||
                "boolean" == typeof s
                  ? String(s)
                  : JSON.stringify(s));
          return e;
        })(r)
      ))
        if (e && "object" == typeof e && !Array.isArray(e))
          for (let [r, s] of Object.entries(e))
            o.searchParams.set(`${t}[${r}]`, String(s));
        else o.searchParams.set(t, e);
    return o;
  };
const d = ((e, r = {}) => {
  let s = r.globals ? { ...t, ...r.globals } : t;
  return {
    globals: s,
    url: new s.URL(e),
    with(t) {
      return { ...this, ...t(this) };
    },
  };
})("http://0.0.0.0:8055").with(
  (
    (t = {}) =>
    (e) => {
      let r = { ...i, ...t };
      return {
        async request(s) {
          let o = s();
          if (
            (o.headers || (o.headers = {}),
            "Content-Type" in o.headers
              ? "multipart/form-data" === o.headers["Content-Type"] &&
                delete o.headers["Content-Type"]
              : (o.headers["Content-Type"] = "application/json"),
            "getToken" in this)
          ) {
            let t = await this.getToken();
            t &&
              (o.headers || (o.headers = {}),
              (o.headers.Authorization = `Bearer ${t}`));
          }
          let n = c(e.url, o.path, o.params),
            a = { method: o.method ?? "GET", headers: o.headers ?? {} };
          "credentials" in r && (a.credentials = r.credentials),
            o.body && (a.body = o.body),
            o.onRequest && (a = await o.onRequest(a)),
            r.onRequest && (a = await r.onRequest(a));
          let i = await (async (t, e, r = globalThis.fetch) => {
            e.headers =
              "object" != typeof e.headers || Array.isArray(e.headers)
                ? {}
                : e.headers;
            let s = await r(t, e);
            return (async function (t) {
              if ("object" == typeof t && t) {
                if (
                  (function (t) {
                    return (
                      !("object" != typeof t || !t) &&
                      "headers" in t &&
                      "ok" in t &&
                      "json" in t &&
                      "function" == typeof t.json &&
                      "text" in t &&
                      "function" == typeof t.json
                    );
                  })(t)
                ) {
                  let e = t.headers.get("Content-Type")?.toLowerCase();
                  if (
                    e?.startsWith("application/json") ||
                    e?.startsWith("application/health+json")
                  ) {
                    let e = await t.json();
                    if (!t.ok) throw e;
                    return "data" in e ? e.data : e;
                  }
                  if (
                    e?.startsWith("text/html") ||
                    e?.startsWith("text/plain")
                  ) {
                    let e = await t.text();
                    if (!t.ok) throw e;
                    return e;
                  }
                  return t;
                }
                return "data" in t ? t.data : t;
              }
            })(s).catch((t) => {
              throw {
                errors: "object" == typeof t && "errors" in t ? t.errors : t,
                response: s,
              };
            });
          })(n.toString(), a, e.globals.fetch);
          return (
            "onResponse" in o && (i = await o.onResponse(i, a)),
            "onResponse" in t && (i = await t.onResponse(i, a)),
            i
          );
        },
      };
    }
  )()
);
var p = (t) => {
  t.get("/", (t, e) => e.send("Hello, World!")),
    t.get("/books", async (t, e) => {
      try {
        const t = await d.request(n("books"));
        e.json(t);
      } catch (t) {
        console.error("Error in /books GET endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.get("/books/:id", async (t, e) => {
      try {
        const r = await d.request(
          n("books", { filter: { id: Number(t.params.id) } })
        );
        e.json(r[0]);
      } catch (t) {
        console.error("Error in /books/:id GET endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.post("/books", async (t, r) => {
      try {
        const s = await d.request(e("books", t.body));
        r.json(s);
      } catch (t) {
        console.error("Error in /books POST endpoint:", t),
          r.status(500).send("Internal Server Error");
      }
    }),
    t.put("/books/:id", async (t, e) => {
      try {
        const r = await d.request(a("books", Number(t.params.id), t.body));
        e.json(r);
      } catch (t) {
        console.error("Error in /books/:id PUT endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.delete("/books/:id", async (t, e) => {
      try {
        await d.request(o("books", Number(t.params.id))), e.status(204).send();
      } catch (t) {
        console.error("Error in /books/:id DELETE endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.get("/tasks", async (t, e) => {
      try {
        const t = await d.request(n("tasks"));
        e.json(t);
      } catch (t) {
        console.error("Error in /tasks endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.post("/tasks", async (t, r) => {
      try {
        const { title: s, description: o, status: n } = t.body,
          a = await d.request(
            e("tasks", { title: s, description: o, status: n })
          );
        r.json(a);
      } catch (t) {
        console.error("Error in /tasks endpoint:", t),
          r.status(500).send("Internal Server Error");
      }
    }),
    t.get("/tasks/:id", async (t, e) => {
      try {
        const r = t.params.id,
          s = await d.request(n("tasks", { filter: { id: r } }));
        e.json(s[0]);
      } catch (t) {
        console.error("Error in /tasks/:id endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.put("/tasks/:id", async (t, e) => {
      try {
        const r = t.params.id,
          { title: s, description: o, status: n } = t.body,
          i = await d.request(
            a("tasks", r, { title: s, description: o, status: n })
          );
        e.json(i);
      } catch (t) {
        console.error("Error in /tasks/:id endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    }),
    t.delete("/tasks/:id", async (t, e) => {
      try {
        const r = t.params.id;
        await d.request(o("tasks", r)),
          e.status(200).send("Task deleted successfully");
      } catch (t) {
        console.error("Error in /tasks/:id endpoint:", t),
          e.status(500).send("Internal Server Error");
      }
    });
};
module.exports = p;
