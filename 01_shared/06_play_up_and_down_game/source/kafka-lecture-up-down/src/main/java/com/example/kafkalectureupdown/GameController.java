package com.example.kafkalectureupdown;

import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class GameController {
    private final int goal;

    public enum GameState{
        LOWER,
        GREATER,
        EQUAL
    }

    public GameController() {
        goal = new Random().ints(1, 300).findFirst().getAsInt();
    }

    public GameState play(int value){
        if(goal == value)       return GameState.EQUAL;
        else if(goal > value)   return GameState.GREATER;
        else                    return GameState.LOWER;
    }

}
