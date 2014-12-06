%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose of the expert system: determine possible compatible jobs based on each employees personalities
%
% WRITE-UP (the program):
% The program is inadequate of remembering input of the users as it move on to search other structured
% representation. See output for repeated request for introversion/extroversion.
%
% WRITE-UP (the system):
% The system is inadequate in determining the interest of the user. This can enhance the results and experience
% of the user. This can be extended by linking each related traits in hobbies/activities to each job activities.
% So, we would have two knowledge-based information, personality traits and activity traits.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INITIALIZE EXPERT SYSTEM
go :-
	intro,
	repeat,
		write('> '),
		read(X),
	do(X),
	X == quit.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INTRODUCTION OF THE EXPERT SYSTEM
intro :-
	write('THIS IS A CAREER COUNSELOR EXPERT SYSTEM WHICH HELP YOU FIND THE RIGHT'), nl,
	write('JOB FOR YOU BASED ON YOUR PERSONALITY PROFILE.'), nl,
	write('Expert information is derived from: http://www.businessinsider.com/best-jobs-for-every-personality-2014-9'), nl,
	write('Enter start to begin.'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% START ASKING QUESTIONS
do(start) :-
	solve,
	!. 
	do(quit).
	
do(X) :-
	write(X),
	write('is not a legal command.'), nl,
	fail. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT TO USER
solve :-
	goal(X,J), nl,
	write('Your personality profile: '), write(X), nl,
	write('Jobs that fit your personality profile: '),  write(J), nl.
solve :-
	write('No answer found.'), nl. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PERFORM SEARCH ON THE EACH PERSONALITY TRAIT
goal(X, J) :- jobs(X, J).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% STRUCTURED REPRESENTATION OF EACH PERSONALITY TRAIT
jobs(X, J) :-
	interaction(extrovert),
	absorption(sensor),
	decision(thinker),
	organization(judger),
	J = [insurance_agent, pharmacist, lawyer, project_manager, judge],
	X = 'Realists who are quick to make practical decisions.'.

jobs(X, J) :-
	interaction(introvert),
	absorption(sensor),
	decision(thinker),
	organization(judger),
	J = [auditor, accountant, chief_financial_officer, web_development_engineer, government_employee],
	X = 'Hard workers who value their responsibilities and commitments.'.
	
jobs(X, J) :-
	interaction(extrovert),
	absorption(sensor),
	decision(feeler),
	organization(judger),
	J = [sales_representative, nurse, social_worker, pr_account_executive, loan_officer],
	X = 'Gregarious traditionalists motivated to help others.'.
	
jobs(X, J) :-
	interaction(introvert),
	absorption(sensor),
	decision(feeler),
	organization(judger),
	J = [dentist, school_teacher, librarian, franchise_owner, customer_service_representative],
	X = 'Modest and determined workers who enjoy helping others.'.

jobs(X, J) :-
	interaction(extrovert),
	absorption(sensor),
	decision(thinker),
	organization(perceiver),
	J = [detective, banker, investor, entertainment_agent, sports_coach],
	X = 'Pragmatists who love excitement and excel in crisis.'.

jobs(X, J) :-
	interaction(introvert),
	absorption(sensor),
	decision(thinker),
	organization(perceiver),
	J = [civil_engineer, economists, pilot, data_communication_analyst, emergency_room_physician],
	X = 'Straightforward and honest people who prefer action to conversation.'.
	
jobs(X, J) :-
	interaction(extrovert),
	absorption(sensor),
	decision(feeler),
	organization(perceiver),
	J = [child_welfare_counselor, primary_care_physician, actor, interior_designer, environmental_scientist],
	X = 'Lively and playful people who value common sense.'.
	
jobs(X, J) :-
	interaction(introvert),
	absorption(sensor),
	decision(feeler),
	organization(perceiver),
	J = [fashion_designer, physical_therapist, massage_therapist, landscape_architect, storekeeper],
	X = 'Warm and sensitive types who like to help people in tangible ways.'.

jobs(X, J) :-
	interaction(extrovert),
	absorption(intuitive),
	decision(thinker),
	organization(judger),
	J = [executive, lawyer, market_research_analyst, management_consultant, venture_capitalists],
	X = 'Natural leaders who are logical, analytical, and good strategic planners.'.

jobs(X, J) :-
	interaction(introvert),
	absorption(intuitive),
	decision(thinker),
	organization(judger),
	J = [investment_banker, personal_financial_advisor, software_developer, economist, executive],
	X = 'Creative perfectionists who prefer to do things their own way.'.
	
jobs(X, J) :-
	interaction(extrovert),
	absorption(intuitive),
	decision(feeler),
	organization(judger),
	J = [adverstising_executive, public_relations_specialist, corporate_coach, sales_manager, hr_professional],
	X = 'People-lover who are energetic, articulate, and diplomatic.'.
	
jobs(X, J) :-
	interaction(introvert),
	absorption(intuitive),
	decision(feeler),
	organization(judger),
	J = [therapist, social_worker, hr_diversity_manager, organizational_development_consultant, customer_relations_manager],
	X = 'Thoughtful, creative people driven by firm principles and personal integrity.'.

jobs(X, J) :-
	interaction(extrovert),
	absorption(intuitive),
	decision(thinker),
	organization(judger),
	J = [entrepreneur, real_estate_developer, advertising_creative_officer, marketing_director, politician],
	X = 'Enterprising creative people who enjoy new challenges.'.

jobs(X, J) :-
	interaction(introvert),
	absorption(intuitive),
	decision(thinker),
	organization(judger),
	J = [computer_programmer, financial_analyst, architect, college_professor, economist],
	X = 'Independent and creative problem-solver.'.
	
jobs(X, J) :-
	interaction(extrovert),
	absorption(intuitive),
	decision(feeler),
	organization(judger),
	J = [journalist, advertising_creative_director, consultant, restaurateur, event_planner],
	X = 'Curious and confident creative types who see possibilities everywhere'.
	
jobs(X, J) :-
	interaction(introvert),
	absorption(intuitive),
	decision(feeler),
	organization(judger),
	J = [graphic_designer, psychologist, writer, physical_therapist, hr_development_trainer],
	X = 'Sensitive idealists motivated by their deeper personal values.'.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXPLANATION FACILITIES
interaction(X) :- explainI, prompt(X, [introvert, extrovert]).
absorption(X) :- explainA, prompt(X, [sensor, intuitive]).
decision(X) :- explainD,  prompt(X, [thinker,feeler]).
organization(X) :- explainO, prompt(X, [judger, perceiver]).

explainI :- nl, write('Introverts often like working alone or in small groups, prefer 
			deliberate pace, and like to focus on one task at a time. '), nl,
	    write('Extroverts are energized by people, enjoy a variety of tasks, a
			quick pace, and good at multitasking. '), nl.
			
explainA :- nl, write('Sensors are realistic people who like to focus on the facts and details 
			and apply common sense and past experience to come up with practical solutions. '), nl,
	    write('Intuitives prefer to focus on possibilities and the big picture, easily see patterns,
			value innovation, and seek creative solutions to problems. '), nl.

explainD :- nl, write('Thinkers tend to make decisions using logical analysis, objectively weigh pros 
			and cons, and value honesty, consistency, and fairness. '), nl,
	    write('Feelers tend to be sensitive and cooperative, and decide based on their own personal
			values and how other will affect by their actions. '), nl.
			
explainO :- nl, write('Judgers tend to be organized and prepared, like to make and stick to plans, 
			and are comfortable following most rules. '), nl,
	    write('Perceivers prefer to keep their options open, like to be able to act spontaneously,
			and like to be flexible with making plans. '), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GET INPUT FROM USER
prompt(V, MenuList) :-
	write('QUESTION: Which personality are you?'), write('?'), nl,
	write('ANSWERS: '), write(MenuList), nl,
	write('Enter your answer: '), read(X),
	checkInput(X, V, MenuList),
	X == V.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAKE SURE INPUTS ARE VALID
checkInput(X, V, MenuList) :-
	member(X, MenuList),
	!.
	
checkInput(X, V, MenuList) :-
	write(X), write(' is not a valid input, try again.'), nl,
	prompt(V, MenuList). 




	
