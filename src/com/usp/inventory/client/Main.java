package com.usp.inventory.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.RootPanel;
import com.github.gwtbootstrap.client.ui.Button;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.RootLayoutPanel;
import com.smartgwt.client.widgets.IButton;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.VLayout;


public class Main implements EntryPoint {

 private static final int HEADER_HEIGHT = 85;
    
    private VLayout mainLayout;
    private HLayout northLayout;
    private HLayout southLayout;
    private VLayout eastLayout;
    private HLayout westLayout;
    
    public void onModuleLoad() {
        
        Window.enableScrolling(false);
        Window.setMargin("0px");
        
        // main layout occupies the whole area
        mainLayout = new VLayout();
        mainLayout.setWidth100();
        mainLayout.setHeight100();
        IButton button = new IButton();
        button.setTitle("Hello");
        mainLayout.addChild(button);

      

        // add the main layout container to GWT's root panel
        RootLayoutPanel.get().add(mainLayout);

    }
    
}