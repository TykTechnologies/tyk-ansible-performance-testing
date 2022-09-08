import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'

import './fonts/Smoolthan/Smoolthan_Bold.otf'
import './index.css'

const analyzer = document.getElementById('analyzer'),
      className = analyzer.classList.value

ReactDOM.createRoot(analyzer).render(
  <React.StrictMode>
    <App
      tyk={className.includes('tyk')}
      kong={className.includes('kong')}
      apollo={className.includes('apollo')}
    />
  </React.StrictMode>
)
