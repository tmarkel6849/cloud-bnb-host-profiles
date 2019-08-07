import React from 'react';
import { shallow, mount } from 'enzyme';
import PhotoBoxContainer from '../client/components/PhotoBoxContainer.jsx';

const mockResponseWithoutCoHost = {
  'id': 54,
  'name': 'Trevino',
  'description': 'Tashia and I are both former educators that work hard to play hard. We are easy-going, outdoor-loving people and love learning other peoples\' stories. We get out of town most weekends and can often be found with a great cup of coffee or a cold IPA in our hands. We are passionate about sharing our love of the outdoors with others as much as possible, but when we are home, we need a comfortable place to lay our heads.',
  'interaction': 'Your host will be on the property and available for anything you need during your stay.',
  'coHosts': {},
  'dateJoined': 'June 2014',
  'languages': ['English'],
  'responseRate': '93%',
  'responseTime': 'within a day',
  'hostUrl': 'https://s3-us-west-1.amazonaws.com/fake-profile-pictures/males3.jpg'
};

const mockResponseWithCoHost = {
  'id': 55,
  "name": "Blackwell",
  "description": "When we host we want everyone to feel pampered. We love traveling, playing sports and cooking, in fact we have a real passion for Italian food and wine. Visit us and your holiday on Lake Como will remain in your heart.",
  "interaction": "",
  "coHosts": {
    "coHost1": {
      "coHostName": "Wade",
      "coHostDateJoined": "December 2017",
      "coHostUrl": "https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost09.jpg"
    },
    "coHost2": {
      "coHostName": "Glass",
      "coHostDateJoined": "February 2013",
      "coHostUrl": "https://s3-us-west-1.amazonaws.com/fake-co-host-pictures/cohost05.jpg"
    }
  },
  "dateJoined": "May 2013",
  "responseRate": "98%",
  "responseTime": "within a day",
  "hostUrl": "https://s3-us-west-1.amazonaws.com/fake-profile-pictures/host10.jpg"
};
