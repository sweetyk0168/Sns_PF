class Admin::EventQuestionnairesAnswersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @event_questionnaires_answer = EventQuestionnairesAnswer.new
  end

  def create
    @event_questionnaires_answer = EventQuestionnairesAnswer.new(event_questionnaires_answer_params)
    if @event_questionnaires_answer.save!
      redirect_to admin_event_questionnaires_answers_index_path
    else
      render 'new'
    end
  end

  # def index
  #   if params[:event_questionnaires_question_id] != nil then
  #       @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:event_questionnaires_question_id])
  #       @events_questionnaires_answers = EventQuestionnairesAnswer.all

  #       # @events_questionnaires_answers = EventQuestionnairesAnswer.all.page(params[:page])
  #   end
  # end

  def show
    @events_questionnaires_answer = EventQuestionnairesAnswer.find(params[:id])
  end

  def event_questionnaires_answer_params
    params.require(:event_questionnaires_answer).permit(:gender, :reason, :satisfaction, :reason_for_satisfaction, :participation, :impressions, :event_questionnaires_question_id)
  end
end
