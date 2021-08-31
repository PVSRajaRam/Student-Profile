import "./mainstyles.css";
import studentIcon from "./student_icon.png";
import DashBoardButton from "./components/DashBoardButton";

function App() {
  return (
    <div className="App">
      <div className="page">
        <div className="page section" id="page-section-1">
          <img
            src={studentIcon}
            id="nav-icon"
            width="50px"
            height="50px"
            alt="Student Icon"
          />
          <div className="btn-group-vertical" id="nav-buttons">
            {/* <DashBoardButton
              className="btn btn-warning custom"
              id="nav-1"
              label="HOME"
            /> */}

            <button
              type="button"
              className="btn btn-warning custom"
              style={{ "margin-top": "30px" }}
              id="nav-1"
            >
              HOME
            </button>
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
        <div className="page section" id="page-section-2">
          <h5 id="welcome-msg">
            <strong>Hello User !</strong>
          </h5>
          <button
            type="button"
            className="btn btn-warning custom"
            id="section-bar"
          >
            DASHBOARD
          </button>
          <div id="page-content">
            <div id="page-content-box">
              <button type="button" className="btn btn-danger topic">
                REMINDERS
              </button>
              <p>
                Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                Dolores voluptas quasi, explicabo dolorem voluptate quia iure
                asperiores autem qui accusamus, culpa ipsum alias aut natus
                nulla ullam, nisi consequatur voluptatem?
              </p>
            </div>
            <div id="page-content-box" style={{ "margin-left": "20%" }}>
              <button type="button" className="btn btn-success topic">
                CIRCULARS
              </button>
              <p>
                Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                Dolores voluptas quasi, explicabo dolorem voluptate quia iure
                asperiores autem qui accusamus, culpa ipsum alias aut natus
                nulla ullam, nisi consequatur voluptatem?
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
