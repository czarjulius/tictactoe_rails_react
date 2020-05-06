import React from 'react';
import './setupTests';
import { shallow, mount, render } from 'enzyme';

import Game from '../components/game/Game';

describe('Game', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Game />)
  })

    test('render a h1 welcome message', () => {
      expect(wrapper.find("h1").text()).toContain("Tic-Tac-Toe");
    });
    test('render a count of html tags on the game component', () => {
      expect(wrapper.find('div').length).toBe(3);
      expect(wrapper.find('h1').length).toBe(1);
      expect(wrapper.find('ul').length).toBe(1);
      expect(wrapper.find('li').length).toBe(9);

    });
});