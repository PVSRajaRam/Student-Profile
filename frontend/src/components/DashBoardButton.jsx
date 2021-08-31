import React from "react";

const DashBoardButton = ({ label, id, style, className }) => {
  return (
    <button
      type="button"
      className="btn btn-warning custom"
      style={{ "margin-top": "30px" }}
      id={id}
    >
      {label}
    </button>
  );
};

export default DashBoardButton;
