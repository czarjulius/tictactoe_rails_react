import React from "react";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";
import { mount } from "enzyme";

import Game from "../components/game/Game";

describe("Game", () => {
  let wrapper;
  let mock;
  beforeEach(() => {
    const fakeStorage = {
      setItem: jest.fn(),
    };

    const props = {
      storage: fakeStorage,
    };
    wrapper = mount(<Game {...props} />);
    mock = new MockAdapter(axios);
  });

  test("render a welcome message", () => {
    expect(wrapper.find("h1").text()).toContain("Tic-Tac-Toe");
  });

  test("create a new game with post method", (done) => {
    mock
      .onPost(`games`, { opponent: "computer", current_player: "human" })
      .reply(201, {
        id: "1",
      });

    wrapper
      .find("form")
      .at(0)
      .simulate("submit", { preventDefault() {} });
    return new Promise((resolve) => setImmediate(resolve)).then(() => {
      expect(wrapper.state("id")).toBe("1");
      expect(wrapper.state("messages")).toEqual({
        board: "",
        win: "",
        draw: "",
        message: { win: "", draw: "", board: [] },
      });
      expect(wrapper.instance().props.storage.setItem).toHaveBeenCalledWith(
        "gameId", "1"
      );

      done();
    });
  });

  test("play game with a patch method will update the state with x move on position 8", (done) => {
    mock.onPatch(`games/${wrapper.state("id")}/move/8`).reply(200, {
      messages: {
        board: [],
        draw: "",
        win: "",
        message: { win: "", draw: "", board: [] },
      },
    });
    wrapper
      .find("li")
      .at(8)
      .simulate("click", { preventDefault() {} });
    return new Promise((resolve) => setImmediate(resolve)).then(() => {
      expect(wrapper.state("messages")).toEqual({
        board: "",
        win: "",
        draw: "",
        message: { win: "", draw: "", board: [] },
      });
      done();
    });
  });
});
