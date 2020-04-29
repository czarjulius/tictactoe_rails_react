import React from 'react';
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';
import { shallow, mount } from 'enzyme';

import './setupTests';

import Game from '../components/game/Game';

describe('Game', () => {
  let wrapper;
  let mock;
  beforeEach(() => {
    wrapper = mount(<Game />)
    mock = new MockAdapter(axios);

  })
  const submitHandler = jest.fn()

    test('render a h1 welcome message', () => {
      expect(wrapper.find("h1").text()).toContain("Tic-Tac-Toe");
    });
    test('render a count of html tags on the game component', () => {
      expect(wrapper.find('div').length).toBe(4);
      expect(wrapper.find('h1').length).toBe(1);
      expect(wrapper.find('ul').length).toBe(1);
      expect(wrapper.find('li').length).toBe(9);

    });

    test('new game button to call submitHandler', () => {

      wrapper.find('button').simulate('submit');
      expect(wrapper.find('button').text()).toBe('New Game');
    });

    test('create a new game with post method', () => {
      mock.onPost('http://localhost:3000/games',  { opponent: "", current_player: '' }).reply(201, {
          id: "1",
      });
      wrapper.find('form').simulate('submit', { preventDefault () {} });
      return new Promise((resolve) => setImmediate(resolve)).then(() => {
        expect(wrapper.state('id')).toBe("1");
      })
     

    });
      

});