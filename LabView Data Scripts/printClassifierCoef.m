function printClassifierCoef(si,roc)
    disp('  ')
    disp('%%  -----------------------------------------------  %%')
    disp('%%  Copy and Paste this section where ''set'' is used  %%')
    disp('%%  -----------------------------------------------  %%')
    for i=1:length(si)
        disp(sprintf('    %%%% Using roc(%d)  (%s vs %s)',si(i),roc(si(i)).px,roc(si(i)).py))
    end
    disp(' ')
    disp('    %% Start of set')
    disp('    set = [              ...')
    for i=1:length(si)
        disp(sprintf('           {''%s''}; ...',roc(si(i)).px))
        disp(sprintf('           {''%s''}; ...',roc(si(i)).py))
    end
    disp('      ];')
    disp('    %% End of set')
    disp('%%  End of Copy and Paste Section #1')
    disp(' ')
    disp('  ')
    disp('%%  ------------------------------------------------------  %%')
    disp('%%  Copy and Paste this section into classifyUsingParams.m  %%')
    disp('%%  ------------------------------------------------------  %%')
    for i=1:length(si)
        disp(sprintf('    %%%% Using roc(%d)  (%s vs %s)',si(i),roc(si(i)).px,roc(si(i)).py))
    end
    disp(' ')
    disp('    %% To be used as enumerators')
    disp('    U = 1; % Undamaged')
    disp('    D = 2; % Damaged')
    disp(' ')
    disp('    %%           Undamaged [y is (+)]    Damaged [y is (-)]')
    N = length(si);
    for i=1:N
        disp(sprintf('    %% Classifier #%d',i))
        disp(sprintf('    %% Classifier Weights'))
        disp(sprintf('    weight(U,%d) = %f; %  ROC TPR - Sensitivity (True Positive Rate)',i,roc(si(i)).TPR))
        disp(sprintf('    weight(D,%d) = %f; % ROC SPC - Specificity (True Negative Rate)',i,roc(si(i)).SPC))
        disp(sprintf('    %% Classifier Coefficients'))
        disp(sprintf('    K(%d) = %f;',i,roc(si(i)).K))
        disp(sprintf('    L(:,%d) = [%f; %f];',i,roc(si(i)).L))
        disp(sprintf('    Q(:,:,%d) = [%f %f; %f %f];',i,roc(si(i)).Q))
        disp(sprintf('    xrange(:,%d) = [%f; %f];',i,roc(si(i)).xrange))
        disp(sprintf('    yrange(:,%d) = [%f; %f];',i,roc(si(i)).yrange))
        disp(sprintf('     '))
    end
    disp('%%  End of Copy and Paste Section #2')
return