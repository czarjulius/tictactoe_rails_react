import React, { Component } from 'react'
import GameForm from '../GameForm'
import Cell from '../Cell'

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
                  <div className="container">
                      <GameForm addGame={this.addGame}/>
                      <h1>Tic-Tac-Toe</h1>
                      <ul id="game">
                        {cells}
                      </ul>

                    <div id="game-messages">
                        <span className="player-x-win">{messages.message && messages.message.win}</span>
                        <span className="draw">{messages.message && messages.message.draw}</span>
                    </div>
                  </div>
                 </div>

                <div className='game_right'>
                </div>
            </>
        )
    }
}

export default Game

