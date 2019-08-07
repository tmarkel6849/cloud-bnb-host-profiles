import React from 'react'
import ReactDOM from 'react-dom/server'
import Host from '../client/components/Host.jsx'
import { render } from 'react-testing-library';

const renderer = (html, props) => {
  const serverHTML = ReactDOM.renderToString( < Host data={props}/> ),
        regex = /(<div id="host">)(<\/div>)/
  html = html.replace(regex, (original, div1, div2) => {
    return div1 + serverHTML + div2;
  });
  return html
}

export default renderer
