import java.util.Scanner;

sealed interface Term permits Term.True, Term.False, Term.Zero, Term.Succ, Term.Pred, Term.IsZero, Term.If {
  record True() implements Term {
  }

  record False() implements Term {
  }

  record Zero() implements Term {
  }

  record Succ(Term t) implements Term {
  }

  record Pred(Term t) implements Term {
  }

  record IsZero(Term t) implements Term {
  }

  record If(Term cond, Term then_, Term else_) implements Term {
  }
}

// --- Evaluator ---
// Pattern matching switch (Java 21) — exhaustiveness checked by compiler, same
// as OCaml match
class Lang {
  static int evaluate(Term term) {
    return switch (term) {
      case Term.True t -> 1;
      case Term.False f -> 0;
      case Term.Zero z -> 0;
      case Term.Succ s -> evaluate(s.t()) + 1;
      case Term.Pred p -> evaluate(p.t()) - 1;
      case Term.IsZero i -> evaluate(i.t()) == 0 ? 1 : 0;
      case Term.If i -> evaluate(i.cond()) == 0
          ? evaluate(i.else_())
          : evaluate(i.then_());
    };
  }

  // --- Parser (recursive descent) ---
  static Term parse(String input) {
    var tokens = input.trim().split("\\s+");
    var cursor = new int[] { 0 }; // int[] so lambda can mutate it

    return parseTerm(tokens, cursor);
  }

  static Term parseTerm(String[] tokens, int[] cursor) {
    var token = tokens[cursor[0]++];
    return switch (token) {
      case "true" -> new Term.True();
      case "false" -> new Term.False();
      case "zero" -> new Term.Zero();
      case "succ" -> new Term.Succ(parseTerm(tokens, cursor));
      case "pred" -> new Term.Pred(parseTerm(tokens, cursor));
      case "iszero" -> new Term.IsZero(parseTerm(tokens, cursor));
      case "if" -> {
        var cond = parseTerm(tokens, cursor);
        cursor[0]++; // consume "then"
        var then_ = parseTerm(tokens, cursor);
        cursor[0]++; // consume "else"
        var else_ = parseTerm(tokens, cursor);
        yield new Term.If(cond, then_, else_);
      }
      default -> throw new IllegalArgumentException("Unexpected token: " + token);
    };
  }

  // --- REPL ---
  public static void main(String[] args) {
    var scanner = new Scanner(System.in);
    System.out.println("Mini language REPL. Ctrl+D to exit.");
    while (true) {
      System.out.print("> ");
      if (!scanner.hasNextLine())
        break;
      var line = scanner.nextLine().trim();
      if (line.isEmpty())
        continue;
      try {
        System.out.println(evaluate(parse(line)));
      } catch (Exception e) {
        System.out.println("Error: " + e.getMessage());
      }
    }
  }
}
