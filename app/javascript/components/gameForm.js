import React, { Component } from "react";

import "./game/game.css";
import AxiosInstance from "../actions/gameActions";

const lookup = {
  human: [
    { id: "player1", text: "Player One" },
    { id: "player2", text: "Player Two" },
  ],
  computer: [{ id: "human", text: "Human" }],
};
class GameForm extends Component {
  state = {
    opponent: "computer",
    current_player: "human",
  };

  onInputChange = ({ target: { name, value } }) => {
    this.setState((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  submitHandler = (e) => {
    e.preventDefault();
    const game = {
      opponent: this.state.opponent,
      current_player: this.state.current_player,
    };
    AxiosInstance({ path: "games", data: game })
      .then((res) => {
        this.props.addGame(res);
      })
      .catch(() => {});
  };

  render() {
    const { opponent } = this.state;
    const options = lookup[opponent];
    return (
      <form className="form-inline" onSubmit={this.submitHandler}>
        <div className="input-group mb-3 mr-sm-2">
          <select
            className="custom-select my-1 mr-sm-2"
            name="opponent"
            onChange={this.onInputChange}
            required
            defaultValue={"DEFAULT"}
          >
            <option value="DEFAULT">Choose Opponent</option>
            <option value="computer">Computer</option>
            <option value="human">Human</option>
          </select>
        </div>

        <div className="input-group mb-3 mr-sm-2">
          <select
            className="custom-select my-1 mr-sm-2"
            name="current_player"
            onChange={this.onInputChange}
            required
          >
            {options.map((o) => (
              <option key={o.id} value={o.id}>
                {o.text}
              </option>
            ))}
          </select>
        </div>

        <button href="#" type="submit" id="reset-game">
          New Game
        </button>
      </form>
    );
  }
}

export default GameForm;
