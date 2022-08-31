import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'

// const fs = require('fs');
import raw from './benchmarks'

console.log(raw)

// fs.readdir('./benchmarks', (err, files) => {
//   console.log(files)
//  // files.forEach(file => {
//  //  const module = import('./' + file).then(m =>
//  //    m.callSomeMethod();
//  //  );
//  //  // or const module = await import('file')
//  //  });
// })

ReactDOM.createRoot(document.getElementById('analyzer')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)
