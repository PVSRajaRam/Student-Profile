import "./mainstyles.css";
import AppSideBar from "./components/AppSideBar";
import MainContent from "./components/MainContent";

function App() {
  return (
    <div className="App">
      <div className="page">
        <AppSideBar />
        <MainContent />
      </div>
    </div>
  );
}

export default App;
