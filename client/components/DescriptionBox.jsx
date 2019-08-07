import React from 'react';
import CoHosts from './CoHosts.jsx';

export default function DescriptionBox(props) {

  if (props.interaction === 'none') {
    return (
      <div id='description-box'>
        <div id='hi-im'>Hi, I'm {props.name}</div>
        <div id='description'>{props.description}</div>
        <CoHosts coHosts={props.coHosts} />
      </div>
    );
  } else {
    return (
      <div id='description-box'>
        <div id='hi-im'>Hi, I'm {props.name}</div>
        <div id='description'>{props.description}</div>
        <div id='interaction-header'>Interaction with guests</div>
        <div id='interaction'>{props.interaction}</div>
        <CoHosts coHosts={props.coHosts} />
      </div>
    );
  }
}