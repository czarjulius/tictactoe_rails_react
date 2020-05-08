import React, { Component } from "react";
import GameForm from "../gameForm";
import Cell from "../Cell";
import ResumeGame from "../ResumeGame";
import "../game/game.css";

class Game extends Component {
  state = {
    messages: {
      board: "",
      win: "",
      draw: "",
    },
    id: "",
  };

  addGame = (form) => {
    const initial_game = {
      board: "",
      win: "",
      draw: "",
    };
    this.setState({
      id: form.id,
      messages: initial_game,
    });
    localStorage.setItem("gameId", form.id);
  };

  playGame = (output) => {
    if (output && output.message) {
      this.setState({
        messages: output,
      });
    }
  };
  resumeGame = (game) => {
    this.setState({
      messages: { message: game.data.message },
      id: game.data.id,
    });
    localStorage.setItem("gameId", game.data.id);
  };

  render() {
    const { messages } = this.state;
    const cells = [];
    for (let index = 0; index < 9; index++) {
      cells.push(
        <Cell
          key={index}
          id={this.state.id}
          playGame={this.playGame}
          position={index}
          message={messages.message && messages.message.board[index]}
          endGame={
            (messages.message && messages.message.win) ||
            (messages.message && messages.message.draw)
          }
        />
      );
    }
    return (
      <>
        <div className="game_left">
          <div className="container">
            <div className="row">
              <div className="col-md-3">
                <GameForm addGame={this.addGame} />
              </div>

              <div className="col-md-6">
                <h3>
                  Current Game ID:{" "}
                  <span className="badge badge-success">{this.state.id}</span>
                </h3>
                <h1>Tic-Tac-Toe</h1>
                <ul id="game">{cells}</ul>

                <div id="game-messages">
                  <span className="game-over">
                    {messages.message &&
                      (messages.message.win || messages.message.draw)}
                  </span>
                </div>
              </div>
              <div className="col-md-3">
                <ResumeGame resumeGame={this.resumeGame} />
              </div>
            </div>
          </div>
        </div>
      </>
    );
  }
}

export default Game;
