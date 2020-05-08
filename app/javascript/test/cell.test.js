import React from 'react';
import { mount } from 'enzyme';
import Cell from '../components/Cell';
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';

describe('Cell', () => {
  let mock;
  beforeEach(() => {
    mock = new MockAdapter(axios);
  })
    it('plays a game move', () => {        
        mock.onPatch(`games/1/move/8`).reply(201, {
            id: "1",
        });
        const props = {
            id: 1,
            position: 8,
            playGame: jest.fn()
        }
        const wrapper = mount(<Cell {...props} />)
        wrapper.find('li').simulate('click');

        return new Promise((resolve) => setImmediate(resolve)).then(() => {
            expect(wrapper.instance().props.playGame).toHaveBeenCalledWith({ id: "1" });
        });
    });
});

