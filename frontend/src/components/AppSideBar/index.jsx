import React from "react";

import PersonIcon from "@material-ui/icons/Person";
import DashBoardButton from "./DashBoardButton";

const AppSideBar = () => {
  return (
    <div className="page section" id="page-section-1">
      <PersonIcon
        id="nav-icon"
        alt="Student Icon"
        fontSize="xl"
        style={{
          display: "flex",
          justifyContent: "center",
        }}
      />

      <div className="btn-group-vertical" id="nav-buttons">
        <DashBoardButton
          className="btn btn-warning custom"
          id="nav-1"
          label="HOME"
        />

        {/* <button
          type="button"
          className="btn btn-warning custom"
          style={{ "margin-top": "30px" }}
          id="nav-1"
        >
          HOME
        </button> */}
        <button
          type="button"
          className="btn btn-warning custom"
          style={{ "margin-top": "30px" }}
          id="nav-2"
        >
          FEE PAYMENTS
        </button>
        <button
          type="button"
          className="btn btn-warning custom"
          style={{ "margin-top": "30px" }}
          id="nav-3"
        >
          GATE PASSES
        </button>
        <button
          type="button"
          className="btn btn-warning custom"
          style={{ "margin-top": "30px" }}
          id="nav-4"
        >
          ACTIVITIES
        </button>
        <button
          type="button"
          className="btn btn-warning custom"
          style={{ "margin-top": "30px" }}
          id="nav-5"
        >
          ACHIEVEMENTS
        </button>
        <button
          type="button"
          className="btn btn-warning custom"
          style={{ "margin-top": "30px" }}
          id="nav-6"
        >
          ATTENDANCE
        </button>
      </div>
    </div>
  );
};

export default AppSideBar;
