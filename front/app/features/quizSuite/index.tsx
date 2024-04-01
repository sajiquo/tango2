
type Quiz = { text: string; options: string[]; answer: string }
type Props = { quizList: Quiz[] }

export const QuizSuite = ({ quizList }: Props) => {
  const quiz = quizList[0]

  return (
    <div>
      <div>
        {quiz.text}
      </div>
      {quiz.options.map(o => <p key={o}>{o}</p>)}
      <div>
        {quiz.answer}
      </div>
    </div>
  )
}
