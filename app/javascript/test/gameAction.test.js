import React from 'react';
import { mount, shallow } from 'enzyme';
import MockAdapter from 'axios-mock-adapter';
import axios from 'axios';

import GameAction from '../actions/gameActions';

import './setupTests';


describe('Test gameAction method', () => {
    let mock = new MockAdapter(axios);
    const path = 'games';
    const url = `http://localhost:3000/${path}`;

    it('Tests axios custom with deafult post method', () => {    
        mock.onPost(`http://localhost:3000/${path}`).reply(201, {
            id: "1",
        });
        GameAction({ path }).then(res => {
          expect(res.id).toBe('1')
        })
    });

    it('Should fail on get with default method', () => {
        mock.onGet(`http://localhost:3000/${path}`).reply(201, {
            id: "1",
        });
        GameAction({ path }).then(res => {
         expect(res).not.toBe('1')
        })
    });

    it('Should return error response', () => {
        mock.onGet(url).reply(400, "Bad request")
        GameAction({ path, method: 'get' }).then(res => {
         expect(res).toBe('Bad request')
        })
    });

    it('Should return error response', () => {
        mock.onGet(url).reply(500, "Server error")
        GameAction({ path, method: 'get' }).then(res => {
         expect(res).toBe('Server error')
        })
    });

    it('Should return error response', () => {
        mock.onGet(url).networkError()
        GameAction({ path, method: 'get' }).then(res => {
         expect(res).toBe('Network Error')
        })
    });
});
