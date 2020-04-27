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
      expect(wrapper.find("h1").text()).toContain("Welcome To Tic Tac Toe Game");
    });
});