# Chat Demo

## Getting started
1. Build the Chat App Docker Image
```shell
docker build -t graphql-go-tools-chat .
```
2. Run as a docker container
```
docker run -it --rm -p 8085:8085 graphql-go-tools-chat
```

Example copied from: [graphql-go-tools](https://github.com/TykTechnologies/graphql-go-tools/tree/master/examples/chat)

## k8s
Deployment and Service manifests available under the `k8s` directory

## Example Messages
```graphql
mutation SendMessage {
  post(roomName: "#test", username: "me", text: "hello!") {
    ...MessageData
  }
}

query GetMessages {
  room(name:"#test") {
    name
    messages {
      ...MessageData
    }
  }
}

subscription LiveMessages {
  messageAdded(roomName: "#test") {
    ...MessageData
  }
}

fragment MessageData on Message{
  id
  text
  createdBy
  createdAt
}
```