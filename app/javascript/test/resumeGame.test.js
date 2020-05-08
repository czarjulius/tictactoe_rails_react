import React from 'react';
import {  mount } from 'enzyme';
import ResumeGame from '../components/ResumeGame';
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';

describe('ResumeGame', () => {
    
  let mock;
  beforeEach(() => {
    mock = new MockAdapter(axios);


  })
    it('resume game by submitting valid id', () => {
        mock.onGet(`games/6`).reply(200, {
            id: '1'
        });

        const resumeGameMock = jest.fn();
        const wrapper = mount(<ResumeGame resumeGame={resumeGameMock}/>);
        wrapper.setState({ id: 6 });

        wrapper.find('form').simulate('submit', { preventDefault() {} });
        return new Promise((resolve) => setImmediate(resolve)).then(() => {
            expect(resumeGameMock).toHaveBeenCalledWith({id: '1'})
        });
    });

    it('resume the last game', () => {
        window.localStorage.setItem('gameId', 5);
        mock.onGet(`games/5`).reply(200, {
            id: "1",
        });

        const props = {
            resumeGame: jest.fn()
        }
        const wrapper = mount(<ResumeGame {...props} />)
        wrapper.find('button').find('.resumeGame').simulate('click');
        return new Promise((resolve) => setImmediate(resolve)).then(() => {
            expect(wrapper.instance().props.resumeGame).toHaveBeenCalledWith({ id: "1" });
        });
    });
});

