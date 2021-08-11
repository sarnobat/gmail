### Don't source control this with the client secret etc.

### Setting up the API

It's a pain to be honest

1) Enable Oauth consent screen (needs to be Production for mine to work)
   * The scope must be added manually and cannot be relative (e.g. it must be https://www.googleapis.com/auth/gmail.readonly)

2) Create an API Key

3) Create a Client ID (includes a secret key). Downloading the JSON is easiest.

4) Click Enable APIs and Services

### How the flow works

It's a lot of work (which is why Oauth is so secure).



```
                        API key
  +---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
  |                                                                                                                                                                                       v
+---------------------+  client_id + client_secret   +------------------+  client_id + client_secret   +---------------+  access_token + refresh_token   +------------+  access_token   +------------------------------+     +-------------+
|    Admin Console    | ---------------------------> | credentials.json | ---------------------------> | /oauth2/token | ------------------------------> | token.json | --------------> | /gmail/v1/users/me@gmail.com | ==> | output.json |
+---------------------+                              +------------------+                              +---------------+                                 +------------+                 +------------------------------+     +-------------+
  |                                                                                                      ^
  | client_id + scopes                                                                                   |
  v                                                                                                      |
+---------------------+  code                                                                            |
|    /oauth2/auth     | ---------------------------------------------------------------------------------+
+---------------------+

```

```
               +-----------+
               | client ID | -+
               +-----------+  |
                 |            |
                 |            |
                 v            |
               +-----------+  |
               |   code    |  |
               +-----------+  |
                 |            |
                 |            |
                 v            v
+--------+     +-----------------------+
| secret | --> |     access_token      |
+--------+     +-----------------------+
                 |                 ^
                 |                 |
                 v                 |
               +-----------+     +-----+
               | response  |     | key |
               +-----------+     +-----+

```
* There aren't many code samples that use shell scripting instead of Python etc. Oauth is a lot of work and doesn't really lend itself to linear Unix pipelines :(

### Notes

* Thanks to this for helping me get it up and running:
   * https://gist.github.com/eruffaldi/98cfb6cc5b11a3778ac9dcb507ac75f4
* For "real" applications it's easier to run if you create a monolithic Golang script
   * hence `gmail_list_messages.go`
