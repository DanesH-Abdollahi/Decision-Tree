% ...........................................................................................................
% *********************  Intoduction To Machine Learning _ Fall 2021 _ Dr.Seyyedin  *************************
% ********************************************  Decision Tree  **********************************************
% *********************  DanesH Abdollahi - 9723053 & Hamidreza Safari Kakroud - 9723050 ********************
% ...........................................................................................................
clc ; clear ; close all ;

%% Question 1

% Part a
fprintf("\tPart a\n") ;
Train_accuracy = 0 ;
Test_accuracy = 0 ;
Percent = 45 ;
for j = 1 : 3
Train = Read_data('adult.train.10k.discrete',Percent) ;
% Reading Features With Values
for i = 1 : size( Train ,2 )
    switch i
        case 1
            Class = Find_Values_Of_Features (Train , i) ;
        case 2
            Workclass = Find_Values_Of_Features (Train , i) ;
        case 3
            Education = Find_Values_Of_Features (Train , i) ;
        case 4
            Marital_status = Find_Values_Of_Features (Train , i) ;
        case 5
            Occupation = Find_Values_Of_Features (Train , i) ;
        case 6
            Relationship = Find_Values_Of_Features (Train , i) ;
        case 7
            Race = Find_Values_Of_Features (Train , i) ;
        case 8
            Sex = Find_Values_Of_Features (Train , i) ;
        case 9
            Native_country = Find_Values_Of_Features (Train , i) ;

    end
end
% Generating Tree
Tree = Generate_Tree ( Train , Class) ;
fprintf("\tStep %d : Tree Size = %d (%d Percent Of Whole Train Dataset)\n",j,Tree_Size ( Tree ),Percent) ;
% Test on Train Dataset

Test = Read_data('adult.train.10k.discrete' , 100) ;
Out = Predict(Test , Tree)  ;
fprintf("\tStep %d : Accuracy On Train Dataset = %f Percent\n",j,Accuracy(Out)*100);
Train_accuracy = Train_accuracy + Accuracy(Out)*100 ;

% Test on Test Dataset
Test = Read_data('adult.test.10k.discrete' , 100) ;
Out = Predict(Test , Tree)  ;
fprintf("\tStep %d : Accuracy On Test Dataset  = %f Percent\n",j,Accuracy(Out)*100);
Test_accuracy = Test_accuracy + Accuracy(Out)*100 ;
fprintf("\n") ;
end
fprintf("\tAverage Accuracy On Train Dataset = %f Percent\n",Train_accuracy/3);
fprintf("\tAverage Accuracy On Test Dataset  = %f Percent\n",Test_accuracy/3);
fprintf("\t-------------------------------------------------------\n") ;

% Part b
fprintf("\tPart b\n") ;
Percent = [55 , 65 , 75] ;
for k = 1 : length(Percent)
    Train_accuracy = 0 ;
    Test_accuracy = 0 ;
    for j = 1 : 3
        Train = Read_data('adult.train.10k.discrete',Percent(k)) ;
        % Reading Features With Values
        for i = 1 : size( Train ,2 )
            switch i
                case 1
                    Class = Find_Values_Of_Features (Train , i) ;
                case 2
                    Workclass = Find_Values_Of_Features (Train , i) ;
                case 3
                    Education = Find_Values_Of_Features (Train , i) ;
                case 4
                    Marital_status = Find_Values_Of_Features (Train , i) ;
                case 5
                    Occupation = Find_Values_Of_Features (Train , i) ;
                case 6
                    Relationship = Find_Values_Of_Features (Train , i) ;
                case 7
                    Race = Find_Values_Of_Features (Train , i) ;
                case 8
                    Sex = Find_Values_Of_Features (Train , i) ;
                case 9
                    Native_country = Find_Values_Of_Features (Train , i) ;
                    
            end
        end
        % Generating Tree
        Tree = Generate_Tree ( Train , Class) ;
        fprintf("\tStep %d : Tree Size = %d (%d Percent Of Whole Train Dataset)\n",j,Tree_Size( Tree ),Percent(k)) ;
        % Test on Train Dataset
        
        Test = Read_data('adult.train.10k.discrete' , 100) ;
        Out = Predict(Test , Tree)  ;
        fprintf("\tStep %d : Accuracy On Train Dataset = %f Percent\n",j,Accuracy(Out)*100);
        Train_accuracy = Train_accuracy + Accuracy(Out)*100 ;
        
        % Test on Test Dataset
        Test = Read_data('adult.test.10k.discrete' , 100) ;
        Out = Predict(Test , Tree)  ;
        fprintf("\tStep %d : Accuracy On Test Dataset  = %f Percent\n",j,Accuracy(Out)*100);
        Test_accuracy = Test_accuracy + Accuracy(Out)*100 ;
        fprintf("\n") ;
    end
    fprintf("\tAverage Accuracy On Train Dataset = %f Percent\n",Train_accuracy/3);
    fprintf("\tAverage Accuracy On Test Dataset  = %f Percent\n",Test_accuracy/3);
    fprintf("\t-------------------------------------------------------\n") ;
end

Percent = 100 ;
Train = Read_data('adult.train.10k.discrete',Percent) ;
% Reading Features With Values
for i = 1 : size( Train ,2 )
    switch i
        case 1
            Class = Find_Values_Of_Features (Train , i) ;
        case 2
            Workclass = Find_Values_Of_Features (Train , i) ;
        case 3
            Education = Find_Values_Of_Features (Train , i) ;
        case 4
            Marital_status = Find_Values_Of_Features (Train , i) ;
        case 5
            Occupation = Find_Values_Of_Features (Train , i) ;
        case 6
            Relationship = Find_Values_Of_Features (Train , i) ;
        case 7
            Race = Find_Values_Of_Features (Train , i) ;
        case 8
            Sex = Find_Values_Of_Features (Train , i) ;
        case 9
            Native_country = Find_Values_Of_Features (Train , i) ;
            
    end
end
% Generating Tree
Tree = Generate_Tree ( Train , Class) ;
fprintf("\tTree Size = %d (%d Percent Of Whole Train Dataset)\n",Tree_Size( Tree ),Percent) ;

% Test on Train Dataset
Test = Read_data('adult.train.10k.discrete' , 100) ;
Out = Predict(Test , Tree)  ;
fprintf("\tAccuracy On Train Dataset = %f Percent\n",Accuracy(Out)*100);

% Test on Test Dataset
Test = Read_data('adult.test.10k.discrete' , 100) ;
Out = Predict(Test , Tree)  ;
fprintf("\tAccuracy On Test Dataset  = %f Percent\n",Accuracy(Out)*100);
fprintf("\n") ;

%% Question2 :
% Part a:
Train = Read_data('adult.train.10k.discrete',100) ;
Test = Read_data('adult.test.10k.discrete' , 100) ;
[Train , Validation] = GetValidation(Train , 75);
for i = 1 : size( Train ,2 )
    switch i
        case 1
            Class = Find_Values_Of_Features (Train , i) ;
        case 2
            Workclass = Find_Values_Of_Features (Train , i) ;
        case 3
            Education = Find_Values_Of_Features (Train , i) ;
        case 4
            Marital_status = Find_Values_Of_Features (Train , i) ;
        case 5
            Occupation = Find_Values_Of_Features (Train , i) ;
        case 6
            Relationship = Find_Values_Of_Features (Train , i) ;
        case 7
            Race = Find_Values_Of_Features (Train , i) ;
        case 8
            Sex = Find_Values_Of_Features (Train , i) ;
        case 9
            Native_country = Find_Values_Of_Features (Train , i) ;

    end
end

Tree = Generate_Tree ( Train , Class) ;
[PrunedTree ,TreeSize ,AccOnTrain ,AccOnValid ,AccOnTest] = Reduced_Error_Pruning( Tree ,Train ,Validation ,Test ) ; %#ok

% plotting :
figure(1) ;
plot(TreeSize,AccOnTrain,'r','LineWidth',1.5);
hold on;
plot(TreeSize,AccOnValid,'b','LineWidth',1.5);
hold on;
plot(TreeSize,AccOnTest,'g','LineWidth',1.5);
grid minor ;
xlabel("Size Of Tree (Number Of Nodes)");
ylabel("Accuracy");
xline(TreeSize(end),'m') ;
legend('On Train Dataset','On Validation Dataset','On Test Dataset','Location','northwest');

% Part b :
train = Read_data('adult.train.10k.discrete',100) ;
Test = Read_data('adult.test.10k.discrete' , 100) ;
[Table1 , Table2] = GetValidation(train , 50);
[Table1 , Table3] = GetValidation(Table1 , 50);
[Table2 , Table4] = GetValidation(Table2 , 50);

Train(1).Table = Table1 ;
Train(2).Table = Table2 ;
Train(3).Table = Table3 ;
Train(4).Table = Table4 ;
Result = struct('PrunedTree',[] ,'TreeSize',[],'AccOnTrain',[],'AccOnValid',[],'AccOnTest',[]) ;

for i = 3 : 4
    Validation = Train(i).Table ;
    switch i
        case 1
            train = vertcat(Train(2).Table, Train(3).Table , Train(4).Table);
        case 2
            train = vertcat(Train(1).Table, Train(3).Table , Train(4).Table);
        case 3
            train = vertcat(Train(1).Table, Train(2).Table , Train(4).Table);
        case 4
            train = vertcat(Train(1).Table, Train(2).Table , Train(3).Table);
    end
    
    for j = 1 : size( train ,2 )
        switch j
            case 1
                Class = Find_Values_Of_Features (train , j) ;
            case 2
                Workclass = Find_Values_Of_Features (train , j) ;
            case 3
                Education = Find_Values_Of_Features (train , j) ;
            case 4
                Marital_status = Find_Values_Of_Features (train , j) ;
            case 5
                Occupation = Find_Values_Of_Features (train , j) ;
            case 6
                Relationship = Find_Values_Of_Features (train , j) ;
            case 7
                Race = Find_Values_Of_Features (train , j) ;
            case 8
                Sex = Find_Values_Of_Features (train , j) ;
            case 9
                Native_country = Find_Values_Of_Features (train , j) ;
        end
    end
    
    Tree = Generate_Tree ( train , Class) ;
    [PrunedTree ,TreeSize ,AccOnTrain ,AccOnValid ,AccOnTest] = Reduced_Error_Pruning( Tree ,train ,Validation ,Test ) ;
    Result(i).PrunedTree = PrunedTree ;
    Result(i).TreeSize = TreeSize ;
    Result(i).AccOnTrain = AccOnTrain ;
    Result(i).AccOnValid = AccOnValid ;
    Result(i).AccOnTest = AccOnTest ;
    % plot each Step:
    figure(i) ;
    plot(TreeSize,AccOnTrain,'r','LineWidth',1.5);
    hold on;
    plot(TreeSize,AccOnValid,'b','LineWidth',1.5);
    hold on;
    plot(TreeSize,AccOnTest,'g','LineWidth',1.5);
    grid minor ;
    title( "Step " + num2str(i) ) ;
    xlabel("Size Of Tree (Number Of Nodes)");
    ylabel("Accuracy");
    xline(TreeSize(end),'m') ;
    legend('On Train Dataset','On Validation Dataset','On Test Dataset','Location','northwest');
end

% Part c :
Train = Read_data('adult.train.10k.discrete',100) ;
Test = Read_data('adult.test.10k.discrete' , 100) ;
Validation = Read_data('adult.test.10k.discrete' , 25) ;
for i = 1 : size( Train ,2 )
    switch i
        case 1
            Class = Find_Values_Of_Features (Train , i) ;
        case 2
            Workclass = Find_Values_Of_Features (Train , i) ;
        case 3
            Education = Find_Values_Of_Features (Train , i) ;
        case 4
            Marital_status = Find_Values_Of_Features (Train , i) ;
        case 5
            Occupation = Find_Values_Of_Features (Train , i) ;
        case 6
            Relationship = Find_Values_Of_Features (Train , i) ;
        case 7
            Race = Find_Values_Of_Features (Train , i) ;
        case 8
            Sex = Find_Values_Of_Features (Train , i) ;
        case 9
            Native_country = Find_Values_Of_Features (Train , i) ;

    end
end

Tree = Generate_Tree ( Train , Class) ;
[PrunedTree ,TreeSize ,AccOnTrain ,AccOnValid ,AccOnTest] = Reduced_Error_Pruning( Tree ,Train ,Validation ,Test ) ;

% plotting :
plot(TreeSize,AccOnTrain,'r','LineWidth',1.5);
hold on;
plot(TreeSize,AccOnValid,'b','LineWidth',1.5);
hold on;
plot(TreeSize,AccOnTest,'g','LineWidth',1.5);
grid minor ;
xlabel("Size Of Tree (Number Of Nodes)");
ylabel("Accuracy");
xline(TreeSize(end),'m') ;
legend('On Train Dataset','On Validation Dataset','On Test Dataset','Location','northwest');

%% Functions
function Table = Read_data ( file , Percent)
opts = delimitedTextImportOptions("NumVariables", 9);
opts.DataLines = [1, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["class", "workclass", "education", "marital_status", "occupation", "relationship", "race", "sex",...
    "native_country"];
opts.VariableTypes = ["string", "string", "string", "string", "string", "string", "string",...
    "string", "string"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts = setvaropts(opts, "class", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["class", "workclass", "education", "marital_status", "occupation", "relationship", "race",...
    "sex", "native_country"], "EmptyFieldRule", "auto");
Table = readtable(file, opts);
Percent_Of_Data = Percent ;
Rand = randperm( size(Table,1) , ((100.0000-Percent_Of_Data)*size(Table,1))/100 ) ;
Table( Rand , : ) = [] ;
clear opts
end


%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
function Values_Of_Features = Find_Values_Of_Features( A ,column_number )

switch column_number

    case 1
        Temp = A.class(1) ;
        Class = ( Temp ) ;

        for i = 2 : length(A.class)

            if isempty( find( Class == A.class(i), 1 ) )
                Class( length(Class) + 1 ) =  A.class(i)  ;
            end

        end
        Values_Of_Features = Class ;

    case 2
        Temp = A.workclass(1) ;
        workclass = ( Temp ) ;

        for i = 2 : length(A.workclass)

            if isempty( find( workclass == A.workclass(i), 1 ) )
                workclass( length(workclass) + 1 ) =  A.workclass(i)  ;
            end

        end
        Values_Of_Features = workclass ;

    case 3
        Temp = A.education(1) ;
        education = ( Temp ) ;

        for i = 2 : length(A.education)

            if isempty( find( education == A.education(i), 1 ) )
                education( length(education) + 1 ) =  A.education(i)  ;
            end

        end
        Values_Of_Features = education ;

    case 4
        Temp = A.marital_status(1) ;
        marital_status = ( Temp ) ;

        for i = 2 : length(A.marital_status)

            if isempty( find( marital_status == A.marital_status(i), 1 ) )
                marital_status( length(marital_status) + 1 ) =  A.marital_status(i)  ;
            end

        end
        Values_Of_Features = marital_status ;

    case 5
        Temp = A.occupation(1) ;
        occupation = ( Temp ) ;

        for i = 2 : length(A.occupation)

            if isempty( find( occupation == A.occupation(i), 1 ) )
                occupation( length(occupation) + 1 ) =  A.occupation(i)  ;
            end

        end
        Values_Of_Features = occupation ;

    case 6
        Temp = A.relationship(1) ;
        relationship = ( Temp ) ;

        for i = 2 : length(A.relationship)

            if isempty( find( relationship == A.relationship(i), 1 ) )
                relationship( length(relationship) + 1 ) =  A.relationship(i)  ;
            end

        end
        Values_Of_Features = relationship ;


    case 7
        Temp = A.race(1) ;
        race = ( Temp ) ;

        for i = 2 : length(A.race)

            if isempty( find( race == A.race(i), 1 ) )
                race( length(race) + 1 ) =  A.race(i)  ;
            end

        end
        Values_Of_Features = race ;

    case 8
        Temp = A.sex(1) ;
        sex = ( Temp ) ;

        for i = 2 : length(A.sex)

            if isempty( find( sex == A.sex(i), 1 ) )
                sex( length(sex) + 1 ) =  A.sex(i)  ;
            end

        end
        Values_Of_Features = sex ;

    case 9
        Temp = A.native_country(1) ;
        native_country = ( Temp ) ;

        for i = 2 : length(A.native_country)

            if isempty( find( native_country == A.native_country(i), 1 ) )
                native_country( length(native_country) + 1 ) =  A.native_country(i)  ;
            end

        end
        Values_Of_Features = native_country ;

end
end
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
function H = Entropy (table , varargin)
number_of_features = nargin - 1  ;
class = Find_Values_Of_Features( table , 1 ) ;
if number_of_features == 0
    data = table.class ;
    Temp = data.matches(class(1)) ;
    num_of_fewer_than_50k = 0 ;
    num_of_higher_than_50k = 0 ;

    for i = 1 : length(data)

        if Temp(i) == 1
            num_of_fewer_than_50k = num_of_fewer_than_50k + 1 ;

        else
            num_of_higher_than_50k = num_of_higher_than_50k + 1 ;
        end

    end
    Prob_class1 = num_of_fewer_than_50k ./ length(data) ;
    Prob_class2 = num_of_higher_than_50k ./ length(data) ;

    H = -Prob_class1 * log2(Prob_class1) - Prob_class2 * log2(Prob_class2) ;

else
    H = zeros( 1 , length ( varargin ) ) ;
    Temp_class = table{ :,1 } ;
    Temp_class_matches = Temp_class.matches ( class(1) ) ;
    for i = 1 : length ( varargin )
        Temp_Values = Find_Values_Of_Features ( table , varargin{i} ) ;
        Temp_column = table{ : ,varargin{i} } ;
        Prob_feature = zeros( 1 , length( Temp_Values ) ) ;
        Prob_class1 = zeros( 1 , length( Temp_Values ) ) ;
        Prob_class2 = zeros( 1 , length( Temp_Values ) ) ;
        for j = 1 : length( Temp_Values )
            counter = 0 ;
            Num_class1 = 0 ;
            Num_class2 = 0 ;
            Temp_feature_matches = Temp_column.matches ( Temp_Values (j) ) ;
            for z = 1 : length( Temp_column )
                if Temp_feature_matches(z)
                    counter = counter + 1 ;
                    if Temp_class_matches(z) ==1
                        Num_class1 = Num_class1 + 1 ;
                    end
                    if Temp_class_matches(z) == 0
                        Num_class2 = Num_class2 + 1 ;
                    end
                end

            end
            Prob_feature(j) = counter / length( Temp_column ) ;
            Prob_class1(j) = Num_class1 / ( Prob_feature(j) * length( Temp_column ) ) ;
            Prob_class2(j) = Num_class2 / ( Prob_feature(j) * length( Temp_column ) ) ;

        end

        for k = 1 : length( Temp_Values )
            H(i) = H(i) + ( Prob_feature(k) * ( -Prob_class1(k)*Log(Prob_class1(k)) - ( Prob_class2(k).*Log(Prob_class2(k) ) ) ) ) ;
        end


    end

end

end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function output = Log(input)
if input ~=0
    output = log2(input) ;
end
if input ==0
    output = 0 ;
end
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = IG( A , Colomn_Numbers )
Out = Entropy( A ) - Entropy( A , Colomn_Numbers ) ;
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = Reconstruct_Table ( table  , N , Value )
Out = table ;
Column = table { : , N } ;
Column_Match = Column.matches ( Value ) ;
X = find ( ~Column_Match ) ;
Out( X' , : ) = [] ;
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = Find_Node ( table , Upper_Node_Numb )
IGain = zeros( 1 , size(table,2)-1 ) ;
for i = 2 : size(table,2)
    if i == Upper_Node_Numb
        continue ;
    end
    IGain(i-1) = IG( table , i ) ;
end
Node_Column_Num = find( IGain == max(IGain) ) + 1 ;
if length( Node_Column_Num ) > 1
    Node_Column_Num = Node_Column_Num(1) ;
end
Node_Feature = convertCharsToStrings( table.Properties.VariableNames{Node_Column_Num} ) ;
Out = [ Node_Column_Num , Node_Feature ] ;
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = Check( table )
Counter = 0 ;
for i = 2 : size( table , 2)
    C = table{: , i} ;
    Match = C.matches( C(1) ) ;
    Temp = find( Match == 1 ) ;
    if length( Temp ) == size( table , 1)
        Counter = Counter + 1 ;
    end

end
if Counter == size( table , 2 ) - 1
    Out = 1 ;
else
    Out = 0 ;
end
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = Voting( table )
Class = Find_Values_Of_Features ( table , 1 ) ;
Temp_Class = table{ : , 1 } ;
Class_Matches = Temp_Class.matches( Class(1) );
if length( find( Class_Matches == 1 ) ) >= length( find( Class_Matches == 0 ) )
    Out = Class(1) ;
else
    Out = Class(2) ;
end
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out  = Predict( Table ,Tree)
Real_Class = Table{ : , 1 };
N = size(Table,1);
Predicted_Class = ["" ; ""] ;
for ii = 1 : N 
    Counter = 0 ;
    Temp = Table{ ii , Tree(1).column_num } ;
    Num = 1 ;
    for j = 2 : size( Tree , 2  )
        if ( Tree(j).Parent_Unique_Num == Num ) && ( Tree(j).Pre_Branch == Temp ) 
            Num = Tree(j).Unique_Num ;
            Temp = Table{ii , Tree(j).column_num } ;
            
            if Tree(j).Type == "Leaf"
                Predicted_Class(ii) = Tree(j).Class ;
                Counter = 1 ;
                break ;
            end
        end
    end
    if Counter == 0
        Predicted_Class(ii) = Tree(1).More_Rapeated_Class ;
%         Predicted_Class(ii) = "Not-found" ;
    end
end

Out = [Real_Class , Predicted_Class] ;
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = Accuracy ( Predict )
count = 0;
for ii = 1 : size( Predict , 1)
    if(Predict(ii , 1) == Predict(ii , 2))
        count = count + 1;
    end
end
Out = count / size(Predict ,1) ;
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Out = More_Repeated_Class(Table)
Class = Find_Values_Of_Features( Table , 1 ) ;
Temp = Table{ : , 1 } ;
Temp_Matches = Temp.matches( Class(1) ) ;
if length( find( Temp_Matches == 1 ) ) >= length( find( Temp_Matches == 0 ) )
    Out = Class(1) ;
else
    Out = Class(2) ;
end
end
%------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------
function Tree = Generate_Tree ( Train , Class ) 

Tree = struct('Unique_Num',[],'Row_Num',[],'column_num',[],'name',[],'feature_values',""...
    ,'Parent_Unique_Num',[],'Parent_C_Num',[],'Parent_Name',"",'Pre_Branch',""...
    ,'Table',[],'Type',"",'Class',[]) ;
%Finding Node 1
IGain = zeros( 1 , size(Train,2)-1 ) ;
for i = 2 : size(Train,2)
    IGain(i-1) = IG( Train , i ) ;
end
Tree(1).Unique_Num = 1 ;
Tree(1).Row_Num = 1 ;
Tree(1).column_num = find( IGain == max(IGain) ) + 1 ;
Tree(1).name = convertCharsToStrings( Train.Properties.VariableNames{Tree(1).column_num} ) ;
Tree(1).feature_values = Find_Values_Of_Features( Train , Tree(1).column_num ) ;
Tree(1).Parent_Unique_Num = [] ;
Tree(1).Parent_C_Num =  [] ;
Tree(1).Parent_Name = [] ;
Tree(1).Pre_Branch =  [] ;
Tree(1).Table = Train ;
Tree(1).Type = "Node" ;
Tree(1).Class = [] ;
Tree(1).More_Rapeated_Class = More_Repeated_Class( Train ) ;

%Finding Other Node's
j = 1 ;
Break = 0 ;
while 1
    cc = 0 ;
    for k = 1 : size( Tree , 2 )
        if ( Tree(k).Unique_Num == j ) && ( Tree(k).Type == "Node" )
            Temp = k ;
            cc = 1 ;
            break ;
        end
    end
    if cc == 0
        j = j+1 ;
        continue ;
    end

    for i = 1 : length( Tree(Temp).feature_values )
        z = size(Tree,2)+1 ;
        B = Reconstruct_Table( Tree(Temp).Table , Tree(Temp).column_num  , Tree(Temp).feature_values(i) ) ;
        Tree(z).Table = B ;
        Classes = B{: , 1} ;
        Class_Match = Classes.matches ( Class(1) ) ;
        if isempty( find( Class_Match == 1, 1 ) )
            Tree(z).Class = Class(2) ;
            Tree(z).Type = "Leaf" ;
            Break = Break + size(B,1) ;
            Tree(z).Parent_C_Num =  Tree(Temp).column_num  ;
            Tree(z).Parent_Name = Tree(Temp).name ;
            Tree(z).Pre_Branch =  Tree(Temp).feature_values(i) ;
            Tree(z).Parent_Unique_Num = Tree(Temp).Unique_Num ;
            Tree(z).Row_Num = Tree(Temp).Row_Num + 1 ;
            Tree(z).Unique_Num = z ;
            continue ;

        elseif isempty( find( Class_Match == 0, 1 ) )
            Tree(z).Class = Class(1) ;
            Tree(z).Type = "Leaf" ;
            Break = Break + size(B,1) ;
            Tree(z).Parent_C_Num =  Tree(Temp).column_num  ;
            Tree(z).Parent_Name = Tree(Temp).name ;
            Tree(z).Pre_Branch =  Tree(Temp).feature_values(i) ;
            Tree(z).Parent_Unique_Num = Tree(Temp).Unique_Num ;
            Tree(z).Row_Num = Tree(Temp).Row_Num + 1 ;
            Tree(z).Unique_Num = z ;
            continue ;

        elseif (Tree(Temp).Row_Num == 8 || Check(B) )
            Tree(z).Class = Voting(B) ;
            Tree(z).Type = "Leaf" ;
            Break = Break + size(B,1) ;
            Tree(z).Parent_C_Num =  Tree(Temp).column_num  ;
            Tree(z).Parent_Name = Tree(Temp).name ;
            Tree(z).Pre_Branch =  Tree(Temp).feature_values(i) ;
            Tree(z).Parent_Unique_Num = Tree(Temp).Unique_Num ;
            Tree(z).Row_Num = Tree(Temp).Row_Num + 1 ;
            Tree(z).Unique_Num = z ;
            continue ;

        else
            Out = Find_Node ( B , Tree(Temp).column_num ) ;
            Tree(z).column_num = str2double( Out(1) ) ;
            Tree(z).name = Out(2) ;
            Tree(z).Type = "Node" ;
            Tree(z).Parent_C_Num =  Tree(Temp).column_num  ;
            Tree(z).Parent_Name = Tree(Temp).name ;
            Tree(z).Pre_Branch =  Tree(Temp).feature_values(i) ;
            Tree(z).Parent_Unique_Num = Tree(Temp).Unique_Num ;
            Tree(z).feature_values = Find_Values_Of_Features( B , Tree(z).column_num ) ;
            Tree(z).Unique_Num = z ;
            Tree(z).Row_Num = Tree(Temp).Row_Num + 1 ;
            continue ;

        end
    end
    j = j + 1 ;
    if Break == size( Train , 1 )
        break;
    end
end
end
%--------------------------------------------------------------------------------
%--------------------------------------------------------------------------------
function Out = Tree_Size ( Tree )
counter = 0 ;
for i = 1 : size( Tree , 2 )
    if Tree(i).Type == "Node"
    counter = counter + 1 ;
    end
end
Out = counter ;
end
%--------------------------------------------------------------------------------
%--------------------------------------------------------------------------------
function [Out1 , Out2 ,Out3 ,Out4 ,Out5] = Reduced_Error_Pruning ( Tree ,Train ,Validation ,Test )
Max_Row_Num = Tree(size(Tree,2)).Row_Num ;
counter2 = 0;
for j = Max_Row_Num : -1 :  2

    c = 0 ;
    for l = size(Tree,2) : -1 :  2
        if Tree(l).Row_Num == j && Tree(l).Type == "Leaf"
            c = c + 1 ;
        end
    end
    Temp3 = 0 ;
    h = 0 ;
    for i = 0 : c - 1
        Temp_Tree = Tree ;
        Rows = size( Temp_Tree , 2 ) ;
        if Temp_Tree(Rows - i + h).Row_Num == j && Temp_Tree(Rows - i + h).Type == "Leaf"
            Temp = Temp_Tree(Rows - i + h ).Parent_Unique_Num ;
            counter = 0 ;
            Temp1 = zeros(1,1) ;
            for k = Rows : -1 : 2
                if Temp_Tree(k).Parent_Unique_Num == Temp && Temp_Tree(k).Type == "Leaf"
                    counter = counter + 1 ;
                    Temp1(counter) = k ;
                    Temp3 = Temp3 + 1 ;
                elseif Temp_Tree(k).Parent_Unique_Num == Temp && Temp_Tree(k).Type == "Node"
                    for l = Rows : -1 : k
                        if Temp_Tree(l).Parent_Unique_Num == Temp && Temp_Tree(l).Type == "Leaf"
                            counter = counter + 1 ;
                            Temp1(counter) = l ;
                            Temp3 = Temp3 + 1 ;
                        end 
                    end  
                end
                if Temp_Tree(k).Unique_Num == Temp
                    Temp2 = k ;
                end
            end
   
            Temp_Tree( Temp1 ) = [] ;
            Temp_Tree(Temp2).Class = Voting( Tree(Temp2).Table ) ;
            Temp_Tree(Temp2).Type = "Leaf" ;
            Temp_Tree(Temp2).Column_Num = [] ;
            Temp_Tree(Temp2).name = [] ;
            Temp_Tree(Temp2).feature_values = [] ;
            if Accuracy( Predict(Validation , Temp_Tree) )*100 >= (Accuracy( Predict(Validation , Tree) ) *100) 
                Tree = Temp_Tree ;
                h = h + 1 ;
%                 disp("Yes") ;
                counter2 = counter2 + 1;
                Out2(counter2) = Tree_Size(Temp_Tree);
                Out3(counter2) = Accuracy( Predict(Train , Temp_Tree) ) * 100 ;
                Out4(counter2) = Accuracy( Predict(Validation , Temp_Tree) )* 100 ;
                Out5(counter2) = Accuracy( Predict(Test , Temp_Tree) ) * 100 ;
            else   
%                 disp("No") ;
            end  
        end
        

    end
end
Out1 = Tree ;

end
%------------------------------------------------------------------------------
%------------------------------------------------------------------------------
function [Out1, Out2] = GetValidation(Table ,Percent)
Rand = randperm( size(Table,1) , ((100.0000-Percent)*size(Table,1))/100 ) ;
Validation = Table(Rand' , : );
Table( Rand , : ) = [] ;
Out1 = Table ;
Out2 = Validation;
end