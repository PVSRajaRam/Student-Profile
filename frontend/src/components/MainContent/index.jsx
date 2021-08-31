import React from "react";

const MainContent = () => {
  return (
    <div className="page section" id="page-section-2">
      <h5 id="welcome-msg">
        <strong>Hello User !</strong>
      </h5>
      <button type="button" className="btn btn-warning custom" id="section-bar">
        DASHBOARD
      </button>
      <div id="page-content">
        <div id="page-content-box">
          <button type="button" className="btn btn-danger topic">
            REMINDERS
          </button>
          <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dolores
            voluptas quasi, explicabo dolorem voluptate quia iure asperiores
            autem qui accusamus, culpa ipsum alias aut natus nulla ullam, nisi
            consequatur voluptatem?
          </p>
        </div>
        <div id="page-content-box" style={{ "margin-left": "20%" }}>
          <button type="button" className="btn btn-success topic">
            CIRCULARS
          </button>
          <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Dolores
            voluptas quasi, explicabo dolorem voluptate quia iure asperiores
            autem qui accusamus, culpa ipsum alias aut natus nulla ullam, nisi
            consequatur voluptatem?
          </p>
        </div>
      </div>
    </div>
  );
};

export default MainContent;
