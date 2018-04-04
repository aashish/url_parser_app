# Index the content(based RESTful Json API application)

This is a tiny RESTful Json API to index a page's content. "Index the content" means to parse the page content and store its content id DB - in this case to store the content that is found inside the tags h1, h2 and h3 and the links.

This is a Ruby on Rails app build on version 5.x
JsonAPI compatible. (https://jsonapi.org)
Implemented with jsonapi_resources gem (https://github.com/cerebris/jsonapi-resources)

## Setup

Download with git
```
git clone https://github.com/aashish/url_parser_app.git
```
scope to project folder

```
$ cd url_parser_app
```

run bundle

```
$ bundle install
```

run migrations

```
$ rake db:migrate
```

run seed file

```
$ rake db:seed
```

start server

```
$ rails s

```

## Try following API's

The API has more than two endpoints. Currently documenting the following API's
- one that receives a url and indexes the content
- one that lists previously stored data


### API 1(one that receives a url and indexes the content):

This endpoint will receive the URL of the page, grab its content and store its content with the tags h1, h2 and h3 and the links in DB.

Curl command:

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"website": "http://jsonapi-resources.com/"}}}' http://localhost:3000/pages
```

Request & Response:

```
$ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"website": "http://jsonapi-resources.com"}}}' http://localhost:3000/pages
HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://localhost:3000/pages/25
ETag: W/"2d453a5d88a2d0e852ff78cb9dfafe91"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 76055faf-27e2-4d86-a7ab-033424a487ca
X-Runtime: 0.859564
Transfer-Encoding: chunked

{"data":{"id":"25","type":"pages","links":{"self":"http://localhost:3000/pages/25"},"attributes":{"website":"http://jsonapi-resources.com"},"relationships":{"contents":{"links":{"self":"http://localhost:3000/pages/25/relationships/contents","related":"http://localhost:3000/pages/25/contents"}}}}}
```

Formatted Json response:

```
{
  "data":{
    "id":"25",
    "type":"pages",
    "links":{
      "self":"http://localhost:3000/pages/25"
    },
    "attributes":{
      "website":"http://jsonapi-resources.com"
    },
    "relationships":{
      "contents":{
        "links":{
          "self":"http://localhost:3000/pages/25/relationships/contents",
          "related":"http://localhost:3000/pages/25/contents"
        }
      }
    }
  }
}
```

### API 2(one that lists previously stored data):

This endpoint will list the urls and content stored in the database such as
- content inside html header tags (H1, H2 and H3)
- links urls

Curl command:

```
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/pages/25?include=contents&fields\[contents\]=info,tag"
```

Request & Response:

```
$  curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/pages/25?include=contents&fields\[contents\]=info,tag"

HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/vnd.api+json
Location: http://localhost:3000/pages/25
ETag: W/"2d453a5d88a2d0e852ff78cb9dfafe91"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 76055faf-27e2-4d86-a7ab-033424a487ca
X-Runtime: 0.859564
Transfer-Encoding: chunked

{"data":{"id":"25","type":"pages","links":{"self":"http://localhost:3000/pages/25"},"attributes":{"website":"http://jsonapi-resources.com"},"relationships":{"contents":{"links":{"self":"http://localhost:3000/pages/25/relationships/contents","related":"http://localhost:3000/pages/25/contents"},"data":[{"type":"contents","id":"1007"},{"type":"contents","id":"1008"},{"type":"contents","id":"1009"},{"type":"contents","id":"1010"},{"type":"contents","id":"1011"},{"type":"contents","id":"1012"},{"type":"contents","id":"1013"},{"type":"contents","id":"1014"},{"type":"contents","id":"1015"},{"type":"contents","id":"1016"},{"type":"contents","id":"1017"},{"type":"contents","id":"1018"},{"type":"contents","id":"1019"},{"type":"contents","id":"1020"},{"type":"contents","id":"1021"},{"type":"contents","id":"1022"},{"type":"contents","id":"1023"},{"type":"contents","id":"1024"},{"type":"contents","id":"1025"},{"type":"contents","id":"1026"},{"type":"contents","id":"1027"},{"type":"contents","id":"1028"},{"type":"contents","id":"1029"},{"type":"contents","id":"1030"},{"type":"contents","id":"1031"},{"type":"contents","id":"1032"},{"type":"contents","id":"1033"},{"type":"contents","id":"1034"},{"type":"contents","id":"1035"},{"type":"contents","id":"1036"},{"type":"contents","id":"1037"},{"type":"contents","id":"1038"},{"type":"contents","id":"1039"}]}}},"included":[{"id":"1007","type":"contents","links":{"self":"http://localhost:3000/contents/1007"},"attributes":{"info":"The Ruby gem forJSON:API Compliance","tag":"h1"}},{"id":"1008","type":"contents","links":{"self":"http://localhost:3000/contents/1008"},"attributes":{"info":"JSONAPI::Resources","tag":"h2"}},{"id":"1009","type":"contents","links":{"self":"http://localhost:3000/contents/1009"},"attributes":{"info":"JSON API Compliant","tag":"h2"}},{"id":"1010","type":"contents","links":{"self":"http://localhost:3000/contents/1010"},"attributes":{"info":"Configurable","tag":"h2"}},{"id":"1011","type":"contents","links":{"self":"http://localhost:3000/contents/1011"},"attributes":{"info":"Minimal Coding","tag":"h2"}},{"id":"1012","type":"contents","links":{"self":"http://localhost:3000/contents/1012"},"attributes":{"info":"Easy to Override","tag":"h2"}},{"id":"1013","type":"contents","links":{"self":"http://localhost:3000/contents/1013"},"attributes":{"info":"PROUDLY SPONSORED BY","tag":"h3"}},{"id":"1014","type":"contents","links":{"self":"http://localhost:3000/contents/1014"},"attributes":{"info":"http://jsonapi-resources.com","tag":"a"}},{"id":"1015","type":"contents","links":{"self":"http://localhost:3000/contents/1015"},"attributes":{"info":"http://jsonapi-resources.com/","tag":"a"}},{"id":"1016","type":"contents","links":{"self":"http://localhost:3000/contents/1016"},"attributes":{"info":"http://jsonapi-resources.com/","tag":"a"}},{"id":"1017","type":"contents","links":{"self":"http://localhost:3000/contents/1017"},"attributes":{"info":"http://jsonapi-resources.com/v0.9/guide/","tag":"a"}},{"id":"1018","type":"contents","links":{"self":"http://localhost:3000/contents/1018"},"attributes":{"info":"http://jsonapi-resources.com/sponsor/","tag":"a"}},{"id":"1019","type":"contents","links":{"self":"http://localhost:3000/contents/1019"},"attributes":{"info":"http://jsonapi-resources.com","tag":"a"}},{"id":"1020","type":"contents","links":{"self":"http://localhost:3000/contents/1020"},"attributes":{"info":"https://github.com/cerebris/jsonapi-resources","tag":"a"}},{"id":"1021","type":"contents","links":{"self":"http://localhost:3000/contents/1021"},"attributes":{"info":"https://gitter.im/cerebris/jsonapi-resources","tag":"a"}},{"id":"1022","type":"contents","links":{"self":"http://localhost:3000/contents/1022"},"attributes":{"info":"https://twitter.com/jsonapi_res","tag":"a"}},{"id":"1023","type":"contents","links":{"self":"http://localhost:3000/contents/1023"},"attributes":{"info":"http://jsonapi-resources.com/v0.9/guide/","tag":"a"}},{"id":"1024","type":"contents","links":{"self":"http://localhost:3000/contents/1024"},"attributes":{"info":"http://jsonapi-resources.com/sponsor/","tag":"a"}},{"id":"1025","type":"contents","links":{"self":"http://localhost:3000/contents/1025"},"attributes":{"info":"http://jsonapi-resources.com","tag":"a"}},{"id":"1026","type":"contents","links":{"self":"http://localhost:3000/contents/1026"},"attributes":{"info":"https://github.com/cerebris/jsonapi-resources","tag":"a"}},{"id":"1027","type":"contents","links":{"self":"http://localhost:3000/contents/1027"},"attributes":{"info":"https://gitter.im/cerebris/jsonapi-resources","tag":"a"}},{"id":"1028","type":"contents","links":{"self":"http://localhost:3000/contents/1028"},"attributes":{"info":"https://twitter.com/jsonapi_res","tag":"a"}},{"id":"1029","type":"contents","links":{"self":"http://localhost:3000/contents/1029"},"attributes":{"info":"http://jsonapi-resources.com/v0.9/guide/","tag":"a"}},{"id":"1030","type":"contents","links":{"self":"http://localhost:3000/contents/1030"},"attributes":{"info":"https://github.com/cerebris/jsonapi-resources","tag":"a"}},{"id":"1031","type":"contents","links":{"self":"http://localhost:3000/contents/1031"},"attributes":{"info":"http://jsonapi.org","tag":"a"}},{"id":"1032","type":"contents","links":{"self":"http://localhost:3000/contents/1032"},"attributes":{"info":"http://www.cerebris.com","tag":"a"}},{"id":"1033","type":"contents","links":{"self":"http://localhost:3000/contents/1033"},"attributes":{"info":"http://jsonapi-resources.com/sponsor","tag":"a"}},{"id":"1034","type":"contents","links":{"self":"http://localhost:3000/contents/1034"},"attributes":{"info":"http://jsonapi-resources.com/sponsor/","tag":"a"}},{"id":"1035","type":"contents","links":{"self":"http://localhost:3000/contents/1035"},"attributes":{"info":"https://github.com/cerebris/jsonapi-resources","tag":"a"}},{"id":"1036","type":"contents","links":{"self":"http://localhost:3000/contents/1036"},"attributes":{"info":"https://gitter.im/cerebris/jsonapi-resources","tag":"a"}},{"id":"1037","type":"contents","links":{"self":"http://localhost:3000/contents/1037"},"attributes":{"info":"https://twitter.com/jsonapi_res","tag":"a"}},{"id":"1038","type":"contents","links":{"self":"http://localhost:3000/contents/1038"},"attributes":{"info":"https://opensource.org/licenses/MIT","tag":"a"}},{"id":"1039","type":"contents","links":{"self":"http://localhost:3000/contents/1039"},"attributes":{"info":"http://www.cerebris.com","tag":"a"}}]}
```

Formatted Json Response:

```
{
  "data":{
    "id":"25",
    "type":"pages",
    "links":{
      "self":"http://localhost:3000/pages/25"
    },
    "attributes":{
      "website":"http://jsonapi-resources.com"
    },
    "relationships":{
      "contents":{
        "links":{
          "self":"http://localhost:3000/pages/25/relationships/contents",
          "related":"http://localhost:3000/pages/25/contents"
        },
        "data":[
          {
            "type":"contents",
            "id":"1007"
          },
          {
            "type":"contents",
            "id":"1008"
          },
          {
            "type":"contents",
            "id":"1009"
          },
          {
            "type":"contents",
            "id":"1010"
          },
          {
            "type":"contents",
            "id":"1011"
          },
          {
            "type":"contents",
            "id":"1012"
          },
          {
            "type":"contents",
            "id":"1013"
          },
          {
            "type":"contents",
            "id":"1014"
          },
          {
            "type":"contents",
            "id":"1015"
          },
          {
            "type":"contents",
            "id":"1016"
          },
          {
            "type":"contents",
            "id":"1017"
          },
          {
            "type":"contents",
            "id":"1018"
          },
          {
            "type":"contents",
            "id":"1019"
          },
          {
            "type":"contents",
            "id":"1020"
          },
          {
            "type":"contents",
            "id":"1021"
          },
          {
            "type":"contents",
            "id":"1022"
          },
          {
            "type":"contents",
            "id":"1023"
          },
          {
            "type":"contents",
            "id":"1024"
          },
          {
            "type":"contents",
            "id":"1025"
          },
          {
            "type":"contents",
            "id":"1026"
          },
          {
            "type":"contents",
            "id":"1027"
          },
          {
            "type":"contents",
            "id":"1028"
          },
          {
            "type":"contents",
            "id":"1029"
          },
          {
            "type":"contents",
            "id":"1030"
          },
          {
            "type":"contents",
            "id":"1031"
          },
          {
            "type":"contents",
            "id":"1032"
          },
          {
            "type":"contents",
            "id":"1033"
          },
          {
            "type":"contents",
            "id":"1034"
          },
          {
            "type":"contents",
            "id":"1035"
          },
          {
            "type":"contents",
            "id":"1036"
          },
          {
            "type":"contents",
            "id":"1037"
          },
          {
            "type":"contents",
            "id":"1038"
          },
          {
            "type":"contents",
            "id":"1039"
          }
        ]
      }
    }
  },
  "included":[
    {
      "id":"1007",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1007"
      },
      "attributes":{
        "info":"The Ruby gem forJSON:API Compliance",
        "tag":"h1"
      }
    },
    {
      "id":"1008",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1008"
      },
      "attributes":{
        "info":"JSONAPI::Resources",
        "tag":"h2"
      }
    },
    {
      "id":"1009",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1009"
      },
      "attributes":{
        "info":"JSON API Compliant",
        "tag":"h2"
      }
    },
    {
      "id":"1010",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1010"
      },
      "attributes":{
        "info":"Configurable",
        "tag":"h2"
      }
    },
    {
      "id":"1011",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1011"
      },
      "attributes":{
        "info":"Minimal Coding",
        "tag":"h2"
      }
    },
    {
      "id":"1012",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1012"
      },
      "attributes":{
        "info":"Easy to Override",
        "tag":"h2"
      }
    },
    {
      "id":"1013",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1013"
      },
      "attributes":{
        "info":"PROUDLY SPONSORED BY",
        "tag":"h3"
      }
    },
    {
      "id":"1014",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1014"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com",
        "tag":"a"
      }
    },
    {
      "id":"1015",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1015"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/",
        "tag":"a"
      }
    },
    {
      "id":"1016",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1016"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/",
        "tag":"a"
      }
    },
    {
      "id":"1017",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1017"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/v0.9/guide/",
        "tag":"a"
      }
    },
    {
      "id":"1018",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1018"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/sponsor/",
        "tag":"a"
      }
    },
    {
      "id":"1019",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1019"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com",
        "tag":"a"
      }
    },
    {
      "id":"1020",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1020"
      },
      "attributes":{
        "info":"https://github.com/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1021",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1021"
      },
      "attributes":{
        "info":"https://gitter.im/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1022",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1022"
      },
      "attributes":{
        "info":"https://twitter.com/jsonapi_res",
        "tag":"a"
      }
    },
    {
      "id":"1023",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1023"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/v0.9/guide/",
        "tag":"a"
      }
    },
    {
      "id":"1024",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1024"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/sponsor/",
        "tag":"a"
      }
    },
    {
      "id":"1025",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1025"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com",
        "tag":"a"
      }
    },
    {
      "id":"1026",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1026"
      },
      "attributes":{
        "info":"https://github.com/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1027",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1027"
      },
      "attributes":{
        "info":"https://gitter.im/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1028",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1028"
      },
      "attributes":{
        "info":"https://twitter.com/jsonapi_res",
        "tag":"a"
      }
    },
    {
      "id":"1029",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1029"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/v0.9/guide/",
        "tag":"a"
      }
    },
    {
      "id":"1030",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1030"
      },
      "attributes":{
        "info":"https://github.com/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1031",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1031"
      },
      "attributes":{
        "info":"http://jsonapi.org",
        "tag":"a"
      }
    },
    {
      "id":"1032",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1032"
      },
      "attributes":{
        "info":"http://www.cerebris.com",
        "tag":"a"
      }
    },
    {
      "id":"1033",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1033"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/sponsor",
        "tag":"a"
      }
    },
    {
      "id":"1034",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1034"
      },
      "attributes":{
        "info":"http://jsonapi-resources.com/sponsor/",
        "tag":"a"
      }
    },
    {
      "id":"1035",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1035"
      },
      "attributes":{
        "info":"https://github.com/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1036",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1036"
      },
      "attributes":{
        "info":"https://gitter.im/cerebris/jsonapi-resources",
        "tag":"a"
      }
    },
    {
      "id":"1037",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1037"
      },
      "attributes":{
        "info":"https://twitter.com/jsonapi_res",
        "tag":"a"
      }
    },
    {
      "id":"1038",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1038"
      },
      "attributes":{
        "info":"https://opensource.org/licenses/MIT",
        "tag":"a"
      }
    },
    {
      "id":"1039",
      "type":"contents",
      "links":{
        "self":"http://localhost:3000/contents/1039"
      },
      "attributes":{
        "info":"http://www.cerebris.com",
        "tag":"a"
      }
    }
  ]
}
```

## ToDo's
- Move Parsing url content to background job
- Explore new API's

## Contributing

1. Fork it ( https://github.com/aashish/url_parser_app/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
