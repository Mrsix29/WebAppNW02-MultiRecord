using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DBSystem.BLL;
using DBSystem.ENTITIES;

namespace WebApp.ExercisePages
{
    public partial class MultiRecordQueryWithCustomGridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageLabel.Text = "";
            
            if (!Page.IsPostBack)
            {
                BindList();
            }
        }

        protected void BindList()
        {
            try
            {
                TeamController teamController = new TeamController();
                List<Teams> listOfTeams = null;
                listOfTeams = teamController.List();
                listOfTeams.Sort((x, y) => x.TeamName.CompareTo(y.TeamName));
                TeamList.DataSource = listOfTeams;
                TeamList.DataTextField = nameof(Teams.TeamName);
                TeamList.DataValueField = nameof(Teams.TeamID);
                TeamList.DataBind();
                TeamList.Items.Insert(0, "Select a Team");
            }
            catch (Exception ex)
            {
                MessageLabel.Text = ex.Message;
            }
        }

        protected void Fetch_Click(object sender, EventArgs e)
        {
            if (TeamList.SelectedIndex == 0)
            {
                MessageLabel.Text = "Select a team to view its players.";
                Coach.Text = "";
                AssistantCoach.Text = "";
                Wins.Text = "";
                Losses.Text = "";
            }
            else
            {
                try
                {
                    PlayerController playerController = new PlayerController();
                    List<Players> listOfPlayers = null;
                    listOfPlayers = playerController.FindByID(int.Parse(TeamList.SelectedValue));
                    listOfPlayers.Sort((x, y) => x.PlayerName.CompareTo(y.PlayerName));
                    PlayerList.DataSource = listOfPlayers;
                    PlayerList.DataBind();
                    

                    TeamController teamController = new TeamController();
                    Teams teamInfo = null;
                    teamInfo = teamController.Teams_FindByID(int.Parse(TeamList.SelectedValue));
                    Coach.Text = teamInfo.Coach;
                    AssistantCoach.Text = teamInfo.AssistantCoach;
                    Wins.Text = teamInfo.Wins.ToString();
                    Losses.Text = teamInfo.Losses.ToString();
                }
                catch (Exception ex)
                {
                    MessageLabel.Text = ex.Message;
                }
            }
        }
        protected void List02_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            PlayerList.PageIndex = e.NewPageIndex;
            Fetch_Click(sender, new EventArgs());
        }
        protected void List02_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow agvrow = PlayerList.Rows[PlayerList.SelectedIndex];
            string playerid = (agvrow.FindControl("PlayerID") as Label).Text;
            Response.Redirect("ReceivingPage.aspx?pid=" + playerid);
        }
    }
}