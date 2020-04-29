import React, { Component } from 'react'
import axios from 'axios';
import './game.css'

class Game extends Component{
    state = {
        form: {
            opponent:"",
            current_player:""
        },
        message: '',
        id: ''
      }

      onInputChange = ({ target: { name, value } }) => {
        this.setState(prevState => ({
          ...prevState,
          form: {
            ...prevState.form,
            [name]: value
          }
        }));
      };

      submitHandler = (e) => {
        e.preventDefault()
        const game = {
            opponent: this.state.form.opponent,
            current_player: this.state.form.current_player
          };
        axios.post(`http://localhost:3000/games`,  game )
          .then(res => {
            this.setState({
                id: res.data.id
              });
          }).catch(() => {})
      };

      onPlayHandler = (positon) => {
        axios.patch(`http://localhost:3000/games/${this.state.id}/move/${positon}`)
          .then(res => {
            this.setState({
                message: res.data.message
              });
          })
      }
      
    render(){
        const { message } = this.state
        return(
            <>
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

                <div className='game_left'>
                    <div className="container">
                        <h1>Tic-Tac-Toe</h1>
                        <ul id="game">
                            <li data-pos="0,0" onClick={() => this.onPlayHandler(0)} id="players">{message[0]}</li>
                            <li data-pos="0,1" onClick={() => this.onPlayHandler(1)} id="players">{message[1]}</li>
                            <li data-pos="0,2" onClick={() => this.onPlayHandler(2)} id="players">{message[2]}</li>

                            <li data-pos="1,0" onClick={() => this.onPlayHandler(3)} id="players">{message[3]}</li>
                            <li data-pos="1,1" onClick={() => this.onPlayHandler(4)} id="players">{message[4]}</li>
                            <li data-pos="1,2" onClick={() => this.onPlayHandler(5)} id="players">{message[5]}</li>
                            
                            <li data-pos="2,0" onClick={() => this.onPlayHandler(6)} id="players">{message[6]}</li>
                            <li data-pos="2,1" onClick={() => this.onPlayHandler(7)} id="players">{message[7]}</li> 
                            <li data-pos="2,2" onClick={() => this.onPlayHandler(8)} id="players">{message[8]}</li>
                        </ul>


                    </div>
                </div>
                <div className='game_right'>
                </div>
            </>
        )
    }
}

export default Game

