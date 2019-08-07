import React from 'react';

export default function PhotoBoxContainer(props) {
  return (
    <div id='photo-box-container'>
      <div id='photo-box'>
        <a id='photo-box-link' href="http://lilbub.com/about">
          <img id='host-image' src={props.hostUrl} title={props.name} alt={props.name}></img>
          <div id='script-name'>{props.name}</div>
        </a>
      </div>
      <a id='below-image-link' href="http://lilbub.com/about">
        <button id='below-image-button'>CONTACT</button>
      </a>
    </div>
  );
} 