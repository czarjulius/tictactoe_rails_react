import React, { Component } from "react";
import AxiosInstance from "../actions/gameActions";

import "./game/game.css";

class Cell extends Component {
  onPlayHandler = () => {
    AxiosInstance({
      path: `games/${this.props.id}/move/${this.props.position}`,
      method: "patch",
    }).then((res) => {
      this.props.playGame(res);
    });
  };

  render() {
    return (
      <li
        data-pos="0,0"
        onClick={() => this.onPlayHandler()}
        id="players"
        className={`${this.props.endGame ? "disableCell" : ""}`}
      >
        {this.props.message}
      </li>
    );
  }
}

export default Cell;
