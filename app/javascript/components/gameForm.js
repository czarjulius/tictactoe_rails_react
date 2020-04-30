import React, { Component } from 'react'
import axios from 'axios';

import './game/game.css'
import AxiosInstance from '../actions/gameActions'



class GameForm extends Component{
    state = {
            opponent:"",
            current_player:""
      }

    onInputChange = ({ target: { name, value } }) => {
        this.setState(prevState => ({
          ...prevState,
            [name]: value
        }));
      };

      submitHandler = (e) => {
        
        e.preventDefault()
        const game = {
            opponent: this.state.opponent,
            current_player: this.state.current_player
          };          
          AxiosInstance({path:`games`, data: game} )
          .then(res => {
            this.props.addGame(res);
          }).catch(() => {})
      };

    render(){
        return(
            <form className="form-inline" onSubmit={this.submitHandler}>
                <div className="input-group mb-2 mr-sm-2">
                    <select className="custom-select my-1 mr-sm-2" name="opponent" onChange={this.onInputChange} required defaultValue={'DEFAULT'}>
                        <option value="DEFAULT">Choose Opponent</option>
                        <option value="computer">Computer</option>
                        <option value="human">Human</option>
                    </select>
                </div>
                <input type="text" required 
                    onChange={this.onInputChange} 
                    name="current_player" 
                    className="form-control mb-2 mr-sm-2" 
                    placeholder="First Player" />                
                <button href="#" type="submit" id="reset-game">New Game</button>
            </form>

        )
    }
}

export default GameForm

