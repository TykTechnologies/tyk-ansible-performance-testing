## Tests

### query_type
Values: `REST`, `STITCH` or `FEDERATE`

`REST`: Uses a REST request.

`STITCH`: Stitches multiple data sources together and presents them as a single GraphQL endpoint.

`FEDERATE`: Stitches multiple supgrahs and presents them as a supergraph.

### query_depth
`query_type`: `STITCH` and `FEDERATE`
Values: `0`, `1` and `2`

`0`: Runs the following GraphQL query:
```
query {
  user(id: 1) {
    username
    name
    email
  }
}
```

`1`: Runs the following GraphQL query:

```
query {
  user(id: 1) {
    username
    name
    email
    posts {
      title
      body
    }
  }
}
```


`2`: Runs the following GraphQL query:
```
query {
  user(id: 1) {
    username
    name
    email
    posts {
      title
      body
      comments {
        name
        email
        body
      }
    }
  }
}
```

