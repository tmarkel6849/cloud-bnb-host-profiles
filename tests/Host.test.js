import React from 'react';
import { shallow, mount } from 'enzyme';
import Host from '../client/components/Host.jsx';
import response from './mockResponses';

beforeAll(() => {
  const mockWithoutCoHost = Promise.resolve(response.withoutCoHosts);
  const mockFetchWithoutCH = Promise.resolve({
    json: () => mockWithoutCoHost,
  });
  return jest.spyOn(global, 'fetch').mockImplementation(() => mockFetchWithoutCH);
});

afterAll(() => {
  global.fetch.mockClear();
});

describe('HostComponent', () => {
  describe('API functionality', () => {
    it('calls the fetch upon didMount given an id', done => {
      expect(global.fetch).not.toHaveBeenCalled();
      const wrapper = shallow(<Host id={54} />);
      process.nextTick(() => {
        expect(global.fetch).toHaveBeenCalledTimes(1);
        done();
      });
    });
    it('calls the fetch with correct path for given id', done => {
      const wrapper = shallow(<Host id={54} />);
      process.nextTick(() => {
        expect(global.fetch).toHaveBeenCalledWith('http://localhost:3005/host/id/54', {'method': 'GET'});
        done();
      });
    });
    it('doesn\'t call fetch if id has default -1', done => {
      const wrapper = shallow(<Host />);
      process.nextTick(() => {
        expect(global.fetch).not.toHaveBeenCalled();
        done();
      });
    });
  });
  describe('Setting state from fetched data', () => {
    it('sets all Host state values from fetch response', done => {
      const wrapper = shallow(<Host id={54} />);
      process.nextTick(() => {
        expect(wrapper.state('name')).toBe('Trevino');
        expect(wrapper.state('description')).not.toBeEmpty();
        expect(wrapper.state('interaction')).toBeString();
        expect(wrapper.state('dateJoined')).toBe('June 2014');
        expect(wrapper.state('languages')).toContainValue('English');
        expect(wrapper.state('responseRate')).toBe('93%');
        expect(wrapper.state('responseTime')).toBe('within a day');
        expect(wrapper.state('hostUrl')).not.toBeEmpty();
        done();
      });
    });
  });
  describe('Rendering the component', () => {
    it('renders with state-fed values', done => {
      const wrap = mount(<Host id={54} />);
      process.nextTick(() => {
        expect(wrap.find('div#hi-im').text()).toEqual('Hi, I\'m Trevino');
        expect(wrap.find('div#description').text()).toEqual(mockResponse.description);
        expect(wrap.find('div#interaction').text()).toEqual(mockResponse.interaction);
        expect(wrap.find('div#languages').text()).toEqual(`Languages: ${mockResponse.languages.join(', ')}`);
        expect(wrap.find('div#joined-in').text()).toEqual(`Joined in ${mockResponse.dateJoined}`);
        expect(wrap.find('div#response-rate').text()).toEqual(`Response rate: ${mockResponse.responseRate}`);
        expect(wrap.find('div#response-time').text()).toEqual(`Response time: ${mockResponse.responseTime}`);
        done();
      });
    });
    it('renders the correct clickable elements', done => {
      const wrap = mount(<Host id={54} />);
      process.nextTick(() => {
        expect(wrap.containsMatchingElement( <button>CONTACT</button> )).toBeTruthy();
        expect(wrap.find('button')).toHaveLength(2);
        done();
      });
    });
  });
});