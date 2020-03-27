# README 
## Brewers Books

### Request/Return:

<details>
<summary>GET '/blurbs' </summary>
<br>

```
 {
    "data": [{
            "id": "1",
            "type": "blurb",
            "attributes": {
                "summary": "this is a blurb",
                "comments": [{
                        "id": 1,
                        "blurb_id": 1,
                        "comment": "This is a comment",
                        "created_at": "2020-03-26T19:25:19.628Z",
                        "updated_at": "2020-03-26T19:25:19.628Z"
                    }, ...
                ]
            }
        },
        {
            "id": "2",
            "type": "blurb",
            "attributes": {
                "summary": "\"this is my blurb\"",
                "comments": []
            }
        }, ...
    ]
}
```
</details>
<br>
<details>
<summary>GET '/blurbs/:id' </summary>
<br>

```
{
    "data": {
        "id": "1",
        "type": "blurb",
        "attributes": {
            "summary": "this is a blurb",
            "comments": [
                {
                    "id": 1,
                    "blurb_id": 1,
                    "comment": "This is a comment",
                    "created_at": "2020-03-26T19:25:19.628Z",
                    "updated_at": "2020-03-26T19:25:19.628Z"
                },
                {
                    "id": 2,
                    "blurb_id": 1,
                    "comment": "'this is a comment on blurb 1'",
                    "created_at": "2020-03-26T19:48:38.067Z",
                    "updated_at": "2020-03-26T19:48:38.067Z"
                }
            ]
        }
    }
}
```

* Ruby version
ruby '2.4.1'
'rails', '~> 5.2.4', '>= 5.2.4.2'

* System dependencies

* Configuration

* Database creation
rake db:setup
* Database initialization


* Services (job queues, cache servers, search engines, etc.)

# brewers_books
