import React, { Component } from "react";

import "./game/game.css";
import AxiosInstance from "../actions/gameActions";

class ResumeGame extends Component {
  state = {
    id: "",
  };

  onInputChange = ({ target: { name, value } }) => {
    this.setState((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  resumeGameHandler = (e) => {
    e.preventDefault();
    AxiosInstance({ path: `games/${this.state.id}`, method: "get" })
      .then((res) => {
        this.props.resumeGame(res);
      })
      .catch(() => {});
  };

  resumeLastGameHandler = () => {
    const id = localStorage.getItem("gameId");
    AxiosInstance({ path: `games/${id}`, method: "get" })
      .then((res) => {
        this.props.resumeGame(res);
      })
      .catch(() => {});
  };

  render() {
    return (
      <>
        <form className="form-inline ml-4" onSubmit={this.resumeGameHandler}>
          <div className="input-group mb-2 mr-sm-2">
            <input
              type="number"
              required
              onChange={this.onInputChange}
              name="id"
              className="form-control mb-2 mr-sm-2"
              placeholder="Enter Game Id"
            />
          </div>

          <button href="#" type="submit" id="reset-game">
            Resume Game
          </button>
        </form>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <button
          className="mr-4 resumeGame"
          id="reset-game"
          onClick={() => this.resumeLastGameHandler()}
        >
          Resume Last Game
        </button>
      </>
    );
  }
}

export default ResumeGame;
