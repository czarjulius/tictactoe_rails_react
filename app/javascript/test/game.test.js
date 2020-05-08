import React from 'react';
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';
import { mount } from 'enzyme';

import Game from '../components/game/Game';

describe('Game', () => {
  let wrapper;
  let mock;
  beforeEach(() => {
    wrapper = mount(<Game />)
    mock = new MockAdapter(axios);

  })

    test('render a h1 welcome message', () => {
      expect(wrapper.find("h1").text()).toContain("Tic-Tac-Toe");
    });

    test('create a new game with post method', () => {
      mock.onPost(`games`,  { opponent: "", current_player: '' }).reply(201, {
          id: "1",
      });
      wrapper.find('form').at(0).simulate('submit', { preventDefault () {} });
      return new Promise((resolve) => setImmediate(resolve)).then(() => {
        expect(wrapper.state('id')).toBe("1");
        expect(wrapper.state('messages')).toEqual({ board: '', win: '', draw: '' });
      })
    });

    test('play game with a patch method will update the state with x move on position 8', () => {
      mock.onPatch(`games/${wrapper.state('id')}/move/8`).reply(200, {
          messages: {"board": "", "draw": "", "win": ""}
      });      
      wrapper.find('li').at(8).simulate('click', { preventDefault() {} });
      return new Promise((resolve) => setImmediate(resolve)).then(() => {
        expect(wrapper.state('messages')).toEqual({ board: '', win: '', draw: '' });
      })
    });

    

});