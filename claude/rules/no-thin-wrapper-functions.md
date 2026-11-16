---
name: no-thin-wrapper-functions
description: "Don't add functions that only call an existing fetch/helper and return or reshape a property of its result"
metadata:
  node_type: memory
  type: feedback
  originSessionId: d1c8db29-908a-435a-90b9-ad520d8f896d
  modified: 2026-11-05T13:59:34.818Z
---

Don't create wrapper functions of the shape `const x = await fun(); return x.prop` (or a light reshape of the result, e.g. into a Map). Call the existing function at the call site and read the needed properties there.

**Why:** The user finds these wrappers pollute the codebase and make code harder to follow. They also provide no value, and add useless function calls to the call stack, instead of simply calling the code that does the job.

**How to apply:** Before adding a helper, check whether it adds real logic (a rule combining fields, a non-trivial mapping, shared error handling worth centralising). If it only forwards to an existing function and picks properties, inline it instead. When unsure, ask the user directly.
