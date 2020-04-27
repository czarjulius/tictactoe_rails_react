import React, { Component } from 'react'
import './game.css'

class Game extends Component{
    render(){
        return(
            <>
                <div className='game_left'>
                    <h1>Welcome To Tic Tac Toe Game</h1>
                </div>
                <div className='game_right'>
                </div>
            </>
        )
    }
}

export default Game