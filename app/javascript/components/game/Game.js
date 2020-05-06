import React, { Component } from 'react'
import GameForm from '../gameForm'
import Cell from '../Cell'
import '../game/game.css'

class Game extends Component{
    state = {
        messages: {
          board: '',
          win:'',
          draw:''
        },
        id: ''
      }

      addGame = (form) => {        
        this.setState({
            id: form.id
          });
        }

        playGame = (output) => {  
           
          if (output&&output.message){
          this.setState({
              messages: output
            });
        }
      }

    render(){
        const { messages } = this.state
        const cells = [];
        for (let index = 0; index < 9; index++) { 
          cells.push( <Cell 
            key={index} 
            id={this.state.id} 
            playGame={this.playGame} 
            position={index} 
            message={messages.message && messages.message.board[index]}
            endGame={messages.message && messages.message.win || messages.message && messages.message.draw }
            />);
        }
        return(
            <>
            
                <div className='game_left'>
                  <h3>Current Game ID: {this.state.id}</h3>
                  <div className="container">

                    <div className="row">
                      <div className="col-md-2">
                        <GameForm addGame={this.addGame}/>
                      </div>
                      
                      <div className="col-md-8">
                          <h1>Tic-Tac-Toe</h1>
                          <ul id="game">
                            {cells}
                          </ul>

                        <div id="game-messages">
                            <span className="game-over">{messages.message && messages.message.win}</span>
                            <span className="game-over">{messages.message && messages.message.draw}</span>
                        </div>
                      </div>
                  </div>


                  </div>
                 </div>
            </>
        )
    }
}

export default Game

