import React from 'react';

export default function CoHosts(props) {
  const length = Object.keys(props.coHosts).length;
  const header = length > 0 ? 'Co-hosts' : 'Co-host';

  const coHostsArray = [];
  for (let key in props.coHosts) {
    coHostsArray.push(props.coHosts[key])
  }

  if (Object.keys(props.coHosts).length !== 0) {
    return (
      <div id='cohosts-container'>
        <div id='cohosts-header'>{header}</div>
        {coHostsArray.map((coHost, i) => {
          return (
            <div className={(i < length - 1 ? 'cohost' : 'cohost-last')} key={i}>
              <img className='cohost-picture' src={coHost.hosturl} />
              <div className='cohost-info'>
                <div className='cohost-name'>{coHost.name}</div>
                <div className='cohost-date-joined'>Joined in {coHost.datejoined}</div>
              </div>
            </div>
          );
        })}
      </div>
    );
  } else {
    return (
      <div></div>
    );
  }
}