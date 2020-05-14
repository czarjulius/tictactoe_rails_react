import React from "react";
import { mount } from "enzyme";
import ResumeGame from "../components/ResumeGame";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";

describe("ResumeGame", () => {
  let mock;
  beforeEach(() => {
    mock = new MockAdapter(axios);
  });
  it("resume game by submitting valid id", (done) => {
    mock.onGet(`games/6`).reply(200, {
      id: "1",
    });

    const fakeStorage = {
      setItem: (key, value) => {
        return ('gameId', 5);
      },
    };

    const props = {
      resumeGame: jest.fn(),
      storage: fakeStorage,
    };
    const wrapper = mount(<ResumeGame {...props} />);
    wrapper.setState({ id: 6 });

    wrapper.find("form").simulate("submit", { preventDefault() {} });
    return new Promise((resolve) => setImmediate(resolve)).then(() => {
      expect(wrapper.instance().props.resumeGame).toHaveBeenCalledWith({ id: "1" });
      done();
    });
  });

  it("resume the last game", (done) => {
    mock.onGet(`games/5`).reply(200, {
      id: "1",
    });

    const fakeStorage = {
      getItem: (key) => {
        return 5;
      },
    };

    const props = {
      resumeGame: jest.fn(),
      storage: fakeStorage,
    };
    const wrapper = mount(<ResumeGame {...props} />);
    wrapper.find("button").find(".resumeGame").simulate("click");
    return new Promise((resolve) => setImmediate(resolve)).then(() => {
      expect(wrapper.instance().props.resumeGame).toHaveBeenCalledWith({
        id: "1",
      });
      done();
    });
  });
});
