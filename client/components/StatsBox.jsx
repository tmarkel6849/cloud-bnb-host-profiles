import React from 'react';

export default function StatsBox(props) {
  let languages = Object.keys(props.languages) === 2 ? `${props.languages.language1}, ${props.languages.language2}` : `${props.languages.language1}`
  return (
    <div id='stats-box'>
      <div id='stats'>
        <div id='joined-in'>Joined in {props.dateJoined}</div>
        <div id='languages'>Languages: {languages}</div>
        <div id='response-rate'>Response rate: {props.responseRate}</div>
        <div id='response-time'>Response time: {props.responseTime}</div>
      </div>
      <a id='button-link' href='http://lilbub.com/about'>
        <button id='main-button'>CONTACT</button>
      </a>
    </div>
  );
}
