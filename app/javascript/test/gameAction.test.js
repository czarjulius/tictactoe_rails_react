import MockAdapter from "axios-mock-adapter";
import axios from "axios";
import GameAction from "../actions/gameActions";

describe("Game Action", () => {
  let mock = new MockAdapter(axios);
  const path = "games";
  const url = `/${path}`;

  it("Tests axios custom with deafult post method", (done) => {
    mock.onPost(`/${path}`).reply(201, {
      id: "1",
    });
    GameAction({ path }).then((res) => {
      expect(res.id).toBe("1");
      done();
    });
  });

  it("Should fail on get with default method", (done) => {
    mock.onGet(`/${path}`).reply(201, {
      id: "1",
    });
    GameAction({ path }).then((res) => {
      expect(res).not.toBe("1");
      done();
    });
  });

  it("Should return error response", (done) => {
    mock.onGet(url).reply(400, "Bad request");
    GameAction({ path, method: "get" }).then((res) => {
      expect(res).toBe("Bad request");
      done();
    });
  });

  it("Should return error response", (done) => {
    mock.onGet(url).reply(500, "Server error");
    GameAction({ path, method: "get" }).then((res) => {
      expect(res).toBe("Server error");
      done();
    });
  });

  it("Should return error response", (done) => {
    mock.onGet(url).networkError();
    GameAction({ path, method: "get" }).then((res) => {
      expect(res).toBe("Network Error");
      done();
    });
  });
});
