import React from "react";
import { mount } from "enzyme";
import GameForm from "../components/gameForm";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";

describe("GameForm", () => {
  let mock;
  beforeEach(() => {
    mock = new MockAdapter(axios);
  });

  it("create new game", (done) => {
    const data = { opponent: "computer", current_player: "human" };
    mock.onPost(`games`, data).reply(201, {
      id: "1",
    });

    const props = {
      addGame: jest.fn(),
    };

    const wrapper = mount(<GameForm {...props} />);

    wrapper.find("form").simulate("submit", { preventDefault() {} });
    return new Promise((resolve) => setImmediate(resolve)).then(() => {
      expect(wrapper.instance().props.addGame).toHaveBeenCalledWith({
        id: "1",
      });
      done();
    });
  });
});
