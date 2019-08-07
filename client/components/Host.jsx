import React from 'react';
import PhotoBoxContainer from './PhotoBoxContainer.jsx';
import DescriptionBox from './DescriptionBox.jsx';
import StatsBox from './StatsBox.jsx';
// import style from './main.scss';

export default class Host extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: props.data.host.id,
      name: props.data.host.name,
      description: props.data.host.description,
      interaction: props.data.host.interaction,
      coHosts: props.data.cohosts,
      dateJoined: props.data.host.datejoined,
      languages: props.data.languages,
      responseRate: props.data.host.responserate,
      responseTime: props.data.host.responsetime,
      hostUrl: props.data.host.hosturl
    };
    this.getHost = this.getHost.bind(this);
  }

  componentDidMount() {
    this.getHost();
  }

  getHost() {
    fetch(`http://${window.location.hostname}:3005/postgres/randomentry`)
      .then(response => response.json())
      .then(result => {
        let host = result.host,
            cohosts = result.cohosts,
            languages = result.languages
        this.setState({
          id: host.id,
          name: host.name,
          description: host.description,
          interaction: host.interaction,
          coHosts: cohosts,
          dateJoined: host.datejoined,
          languages: languages,
          responseRate: host.responserate,
          responseTime: host.responsetime,
          hostUrl: host.hosturl
        })
      })
  }

  render() {
    const length = Object.keys(this.state.coHosts).length;
    let greeting = length > 0 ? 'Meet your hosts': 'Meet your host';

    return (
      <div id='host-profile'>
        <div id='greeting'>
          {greeting}
        </div>
        <div id='host-info'>
          <PhotoBoxContainer
            name={this.state.name}
            hostUrl={this.state.hostUrl} />
          <div id='info-container'>
            <DescriptionBox
              name={this.state.name}
              description={this.state.description}
              interaction={this.state.interaction}
              coHosts={this.state.coHosts} />
            <StatsBox
              dateJoined={this.state.dateJoined}
              languages={this.state.languages}
              responseRate={this.state.responseRate}
              responseTime={this.state.responseTime} />
          </div>
        </div>
        <div id='divider'></div>
      </div>
    );
  }
}