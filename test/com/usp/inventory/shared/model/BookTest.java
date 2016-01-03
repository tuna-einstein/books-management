package com.usp.inventory.shared.model;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class BookTest extends AppEngineTestCase {

    private Book model = new Book();

    @Test
    public void test() throws Exception {
        assertThat(model, is(notNullValue()));
    }
}
