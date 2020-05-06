import React from 'react';
import {  mount } from 'enzyme';
import GameForm from '../components/gameForm';
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';


import './setupTests';


describe('Test gameForm component', () => {
    
    it('Test click event', () => {
        let mock = new MockAdapter(axios);
        const data = {opponent: '',current_player: ''}
        mock.onPost('http://localhost:3000/games', data).reply(201, {
            id: "1",
        });

        const addGameMock = jest.fn();
        const wrapper = mount(<GameForm addGame={addGameMock}/>);
        
        wrapper.find('form').simulate('submit', { preventDefault() {} });
        return new Promise((resolve) => setImmediate(resolve)).then(() => {
            expect(addGameMock).toHaveBeenCalledWith({id: '1'})
        });
    });
});

