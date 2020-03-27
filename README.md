## Brewers Social Network
This is the continuation of an interview conducted by Brewer Digital. I was tasked with creating a 'social networking' web application. I chose to focus on building out an API for the purpose of demonstration as well as to follow the popular design pattern of having a backend 'api' which serves JSON data through it's endpoints for a frontend application to consume.

A quick note on authentication/authorization. I chose to implement token-authentication for the purpose of novelty as well as working with a few new gems. Due to the lack of a users#create endpoint, in order to begin making requests to the api you must follow these steps: (after you've followed the initial database setup steps)
~~~
$ rails console
$ User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
~~~

Now that the user is created we can hit the POST '/authenticate' end point in order to receive our token.

If you've made your request successfully your response will look like this:
~~~
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODUzODYxOTF9.bV07F-TLp3yXN__rLhZLW4oMtexnw1KYnHxHctUqq0k"
}
~~~

For all requests going forward you will supply this token to the Authorization header or if using Postman, Authorization (type: Bearer Token). The token expires after 24 hours so be sure to refresh via POST '/authenticate' if necessary.

A future goal would be to implement the ability for 'guest users' to be able to see GET '/blurbs' without any authentication/authorization.

### Request/Return:

<details>
<summary>GET '/blurbs' </summary> Status Code: 200 OK
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
                "summary": "this is my blurb",
                "comments": []
            }
        }, ...
    ]
}
```
</details>
<details>
<summary>GET '/blurbs/:id' </summary> Status Code: 200 OK
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
</details>

<details>
<summary>POST '/blurbs?summary=example_blurb_post' </summary> Status Code: 201 Created
<br>
 
 ```
 {
    "response": "Blurb Created"
}
```
</details>

<details>
<summary>POST '/blurb/:id/comments?comment=Hello_World' </summary> Status Code: 201 Created
<br>
 
  ```
 {
    "response": "Comment Created"
}
```


 
</details>

<details>
<summary>DELETE '/blurbs/:id' </summary> Status Code: 200 OK
<br>
 
  ```
 {
    "response": "Blurb Deleted"
}
```
</details>

<details>
 <summary>POST '/authenticate?email=example@mail.com&password=password_goes_here' </summary> Status Code: 200 OK
 <br>
 
```
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODUzODYxOTF9.bV07F-TLp3yXN__rLhZLW4oMtexnw1KYnHxHctUqq0k"
}
```
</details>

### Ruby/Rails version
ruby '2.4.1'
'rails', '~> 5.2.4', '>= 5.2.4.2'

### Initial Setup 
~~~
$ bundle install
$ rake db:setup
$ rake db:migrate
~~~

### Run the application locally
~~~
$ rails server
~~~
